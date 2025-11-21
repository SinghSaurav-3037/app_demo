import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/network_checker/network_checker.dart';
import 'package:flutter_app_demo/service/api_service.dart';
import 'package:flutter_app_demo/service/db_service.dart';
import '../models/academy_list_model.dart';

enum LoadState { idle, loading, success, error }

class AcademyViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final DBService _dbService = DBService();

  List<AcademyListModel> _projects = [];
  LoadState _state = LoadState.idle;
  String _errorMessage = '';

  List<AcademyListModel> get projects => _projects;

  LoadState get state => _state;

  String get errorMessage => _errorMessage;

  /// Load projects in online/offline mdoe
  Future<void> loadProjects({bool forceRefresh = false}) async {
    _state = LoadState.loading;
    _errorMessage = '';
    notifyListeners(); // Notify UI to show loading

    try {
      final online = await NetworkChecker.hasConnection();

      if (online) {
        // Online mode: fetch only Active projects with program 'SA'
        final rawList = await _apiService.fetchProjects(status: 'Active', program: 'SA');
        final fetched = rawList.map((json) => AcademyListModel.fromJson(json)).toList();

        // Sync the fetched data into local DB (replace existing records)
        await _dbService.insertProjects(fetched);

        // Update local state for UI
        _projects = fetched;
        _state = LoadState.success;
      } else {
        // Offline mode: load all projects from local database
        final cached = await _dbService.getProjects();
        _projects = cached;
        _state = LoadState.success;
      }
    } catch (e) {
      // Error handling: try to load from cache in case of API/DB failures
      try {
        final cached = await _dbService.getProjects();
        if (cached.isNotEmpty) {
          _projects = cached;
          _state = LoadState.success;
          _errorMessage = 'Loaded from cache due to error: ${e.toString()}';
        } else {
          _state = LoadState.error;
          _errorMessage = e.toString();
        }
      } catch (dbErr) {
        _state = LoadState.error;
        _errorMessage = 'Error: ${e.toString()} | DB error: ${dbErr.toString()}';
      }
    }

    notifyListeners(); // Notify UI to refresh with new state
  }

  /// to refresh list  in UI
  Future<void> refresh() async {
    await loadProjects(forceRefresh: true);
  }
}

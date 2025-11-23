import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/network/network_checker.dart';
import 'package:flutter_app_demo/features/academy_list_page/services/api_service.dart';
import 'package:flutter_app_demo/features/academy_list_page/services/db_service.dart';
import '../model/academy_list_model.dart';

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

  Future<void> loadProjects({bool forceRefresh = false}) async {
    _state = LoadState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      final online = await NetworkChecker.hasConnection();

      if (online) {
        // Fetch ALL Data from Api
        final rawList = await _apiService.fetchProjects();
        final allProjects =
        rawList.map((json) => AcademyListModel.fromJson(json)).toList();

        // Filter data
        final filteredProjects = allProjects
            .where((p) => p.status == "Active" && p.program == "SA")
            .toList();

        // Clear DB and insert ALL data
        await _dbService.clearProjects();
        await _dbService.insertProjects(allProjects);

        // Show Latest sync records in online mode
        _projects = filteredProjects;
        _state = LoadState.success;
      } else {
        // show all records from db in offline mode
        final cached = await _dbService.getProjects();
        _projects = cached;
        _state = LoadState.success;
      }
    } catch (e) {
      // If any error, load data from db
      try {
        final cached = await _dbService.getProjects();
        if (cached.isNotEmpty) {
          _projects = cached;
          _state = LoadState.success;
          _errorMessage = "Loaded from db due to error: $e";
        } else {
          _state = LoadState.error;
          _errorMessage = e.toString();
        }
      } catch (dbErr) {
        _state = LoadState.error;
        _errorMessage = "Error: $e | DB Error: $dbErr";
      }
    }

    notifyListeners();
  }

  Future<void> refresh() async {
    await loadProjects(forceRefresh: true);
  }
}

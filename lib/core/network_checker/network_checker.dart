import 'package:connectivity_plus/connectivity_plus.dart';

/// Simple network availability check
class NetworkChecker {
  /// Returns true if connected to any network (wifi/mobile).

  static Future<bool> hasConnection() async {
    final c = await Connectivity().checkConnectivity();
    return c != ConnectivityResult.none;
  }

  /// Stream to listen for connectivity changes (optional).
  static Stream<List<ConnectivityResult>> get connectivityStream =>
      Connectivity().onConnectivityChanged;

}

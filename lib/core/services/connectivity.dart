import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController {
  NetworkController._internal();

  static final NetworkController instance = NetworkController._internal();

  final Connectivity _connectivity = Connectivity();

  // Stream to listen for connectivity changes
  Stream<bool> get connectivityStream =>
      _connectivity.onConnectivityChanged.map((result) =>
          result.first == ConnectivityResult.mobile ||
          result.first == ConnectivityResult.wifi ||
          result.first == ConnectivityResult.vpn);

  // Method to check current connectivity state
  Future<bool> checkConnectivity() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    // Check if any result is mobile, wifi, or vpn
    return results.any((result) =>
        result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.vpn);
  }
}

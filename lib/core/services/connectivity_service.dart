import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityServiceProtocol {
  Future<bool> hasNetworokConnection();
}

class ConnectivityService implements ConnectivityServiceProtocol {
  @override
  Future<bool> hasNetworokConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}

import 'dart:io';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:injectable/injectable.dart';

import '../contract/local/i_connection_service.dart';

@Singleton(as: IConnectionService)
class ConnectionService implements IConnectionService {
  @override
  Future<bool> checkConnection() async {
    // var state = await Connectivity().checkConnectivity();
    // if(state == ConnectivityResult.mobile || state == ConnectivityResult.wifi) {
    if (await ConnectivityWrapper.instance.isConnected) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } on SocketException catch (_) {
        return false;
      }
    } else {
      return false;
    }
  }
}

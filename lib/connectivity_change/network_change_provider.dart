import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<bool>((ref){
  return Connectivity().onConnectivityChanged.map((event) => ConnectivityUtility.checkConnectivity(event));
});

class ConnectivityUtility{
  static bool checkConnectivity(ConnectivityResult result){
    switch(result){
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.none:
      default:
        return false;
    }
  }
}
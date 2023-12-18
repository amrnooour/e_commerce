import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

extension ConnectivityExtenstions on Connectivity {
  Future<bool> get isInternetConnected async {
    ConnectivityResult result = await checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}

extension ScreenPercentage on num {
  double h(BuildContext context) {
    return (this / MediaQuery.of(context).size.height) * 100;
  }

  double w(BuildContext context) {
    return (this / MediaQuery
        .of(context)
        .size
        .width) * 100;
  }
}
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternetStatus {
  bool isNetwork = true;

  bool setConnectionCheck(BuildContext context) {
    var connectivityResult = (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isNetwork = true;
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      isNetwork = true;
    }
    else {
      isNetwork = false;
    }
    return isNetwork;
  }
}

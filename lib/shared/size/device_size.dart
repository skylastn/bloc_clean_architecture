import 'package:flutter/material.dart';

class DeviceSize {
  static double getMobileSize(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth > 599) {
      return 600;
    }
    return deviceWidth;
  }
}

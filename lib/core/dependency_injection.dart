import 'dart:developer';

import 'package:kiosk_bo/main.dart';
import '../app/global/logic/global_data.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    try {
      // Get.put(LocalController());
      services.registerSingleton<GlobalLogic>(GlobalLogic());
    } catch (e) {
      log('error Init Dependency $e');
    }
  }
}

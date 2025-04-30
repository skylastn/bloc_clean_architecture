import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Toast {
  static void showInfo({required String message}) {
    SmartDialog.showToast(message);
    // Get.snackbar(
    //   title, message,
    //   backgroundColor: Colors.greenAccent,
    //   colorText: Colors.white,
    //   overlayColor: Colors.greenAccent,
    //   snackStyle: SnackStyle.FLOATING,
    //   animationDuration: const Duration(seconds: 2),
    //   duration: const Duration(seconds: 2),
    //   icon: const Icon(Icons.info),
    //   // borderColor: Colors.greenAccent
    // );
  }
}

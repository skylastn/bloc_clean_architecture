import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Toast {
  static void showInfo({required String message}) {
    SmartDialog.showToast(message);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../animation/floating_loading_animation.dart';

class LoadingDialog {
  static Future<void> show() async {
    await SmartDialog.showLoading(
      builder: (context) {
        return const Center(child: FloatingLoadingAnimation());
      },
    );
  }

  static Future<void> dismiss() async {
    await SmartDialog.dismiss();
  }
}

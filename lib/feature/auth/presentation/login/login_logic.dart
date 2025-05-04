import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_bo/app/global/logic/auth_logic.dart';
import 'package:kiosk_bo/app/global/logic/local_session.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/request/auth_request.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/dashboard_page.dart';
import 'package:kiosk_bo/main.dart';
import 'package:kiosk_bo/shared/toast/toast.dart';

import '../../../../shared/dialog/loading_dialog.dart';
import '../../../../shared/utils/navigation.dart';

class LoginLogic {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isHidePassword = true;
  final authLogic = inject.get<AuthLogic>();
  final localLogic = inject.get<LocalSession>();

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    try {
      LoadingDialog.show();
      var result = await authLogic.login(
        AuthRequest(
          username: usernameController.text,
          password: passwordController.text,
          deviceToken: await localLogic.deviceToken,
          isEmail: true,
        ),
      );
      LoadingDialog.dismiss();
      result.fold((l) => throw Exception(l), (r) {
        log('Login successful');
        localLogic.setUsername(usernameController.text);
        localLogic.setPassword(passwordController.text);
        Navigation.pushReplacementNamed(DashboardPage.routeName);
      });
    } catch (e) {
      log('Error during login: $e');
      if (e is Exception) {
        Toast.showInfo(message: e.toString());
      } else {
        Toast.showInfo(message: 'error : ${e.toString()}');
      }
    }
  }

  void init() {
    if (kDebugMode) {
      usernameController.text = 'nyahtengah@gmail.com';
      passwordController.text = '000000';
    }
  }
}

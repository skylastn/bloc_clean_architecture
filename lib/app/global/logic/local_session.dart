import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/env.dart';
import 'package:universal_html/html.dart' as html;

import '../../../feature/core/infrastructure/model/request/cart_request.dart';

class LocalSession {
  late SharedPreferences pref;

  Future<void> initLocalDatabase() async {
    pref = await SharedPreferences.getInstance();
  }

  String? get mallId {
    return pref.getString('mallId');
  }

  Future<void> setMallId(String? data) async {
    await pref.setString('mallId', data ?? '');
  }

  String? get token {
    return pref.getString('token');
  }

  Future<void> setToken(String? data) async {
    await pref.setString('token', data ?? '');
  }

  String? get deviceToken {
    return pref.getString('deviceToken');
  }

  Future<void> setDeviceToken(String? data) async {
    await pref.setString('deviceToken', data ?? '');
  }

  String? get userId {
    return pref.getString('userId');
  }

  Future<void> setUserId(String? data) async {
    await pref.setString('userId', data ?? '');
  }

  List<CartRequest> get cart {
    final result = pref.getString('cart');
    if ((result ?? '').isEmpty) {
      return [];
    }
    return cartRequestFromJson(result ?? '');
  }

  Future<void> setCart(List<CartRequest>? data) async {
    log('insert cart : ${cartRequestToJson(data ?? [])}');
    await pref.setString('cart', cartRequestToJson(data ?? []));
  }

  Future<void> saveFcmToken(String loginType) async {
    await pref.setString('fcmToken', loginType);
  }

  Future<String> initFcmToken() async {
    try {
      if (!kIsWeb &&
          (Platform.isWindows || Platform.isFuchsia || Platform.isLinux)) {
        return '';
      }
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission();
      log('notification : ${settings.authorizationStatus.name}');

      String temp = pref.getString('fcmToken') ?? '';
      if (temp.isEmpty) {
        log(Env.value.vapidKey);
        temp =
            await FirebaseMessaging.instance.getToken(
              vapidKey: (kIsWeb) ? Env.value.vapidKey : null,
            ) ??
            '';
        saveFcmToken(temp);
      }
      log('Token Fcm : $temp');
      return temp;
    } catch (e) {
      log('error init Fcm Token : $e');
      if (kIsWeb && kDebugMode) {
        await Future.delayed(const Duration(seconds: 1));
        html.window.location.reload();
      }
      return '';
    }
  }

  Future<void> saveIdNotif(int value) async {
    await pref.setInt('idNotif', value);
    if (kDebugMode) {
      print('ID Notif : $value');
    }
  }

  Future<int> getidNotif() async {
    if (pref.getInt('idNotif') == null) {
      await saveIdNotif(0);
    }
    int idNotif = pref.getInt('idNotif') ?? 0;
    saveIdNotif(idNotif + 1);
    return idNotif;
  }
}

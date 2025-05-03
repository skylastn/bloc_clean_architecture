import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/env.dart';
import 'package:universal_html/html.dart' as html;

import '../../../feature/core/infrastructure/model/request/cart_request.dart';
import '../model/token_model.dart';

class LocalSession {
  late FlutterSecureStorage pref;

  void initLocalDatabase() {
    pref = FlutterSecureStorage();
  }

  Future<String?> get mallId async {
    return await pref.read(key: 'mallId');
  }

  Future<void> setMallId(String? data) async {
    await pref.write(key: 'mallId', value: data ?? '');
  }

  Future<String?> get username async {
    return await pref.read(key: 'username');
  }

  Future<void> setUsername(String? data) async {
    await pref.write(key: 'username', value: data ?? '');
  }

  Future<String?> get password async {
    return await pref.read(key: 'password');
  }

  Future<void> setPassword(String? data) async {
    await pref.write(key: 'password', value: data ?? '');
  }

  Future<TokenModel?> get tokenModel async {
    var res = await pref.read(key: 'deviceToken') ?? '';
    if (res.isEmpty) {
      return null;
    }
    var result = jsonDecode(res);
    if (result == null) {
      return null;
    }
    return TokenModel.fromMap(result);
  }

  Future<void> setTokenModel(TokenModel? data) async {
    var result = data == null ? null : jsonEncode(data.toMap());
    await pref.write(key: 'deviceToken', value: result);
  }

  Future<String?> get deviceToken async {
    return await pref.read(key: 'deviceToken');
  }

  Future<void> setDeviceToken(String? data) async {
    await pref.write(key: 'deviceToken', value: data ?? '');
  }

  Future<String?> get userId async {
    return await pref.read(key: 'userId');
  }

  Future<void> setUserId(String? data) async {
    await pref.write(key: 'userId', value: data ?? '');
  }

  Future<List<CartRequest>> get cart async {
    final result = await pref.read(key: 'cart');
    if ((result ?? '').isEmpty) {
      return [];
    }
    return cartRequestFromJson(result ?? '');
  }

  Future<void> setCart(List<CartRequest>? data) async {
    log('insert cart : ${cartRequestToJson(data ?? [])}');
    await pref.write(key: 'cart', value: cartRequestToJson(data ?? []));
  }

  Future<void> saveFcmToken(String loginType) async {
    await pref.write(key: 'fcmToken', value: loginType);
  }

  Future<String?> get getFcmToken async {
    return await pref.read(key: 'fcmToken') ?? '';
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

      String temp = await getFcmToken ?? '';
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
    await pref.write(key: 'idNotif', value: value.toString());
    if (kDebugMode) {
      print('ID Notif : $value');
    }
  }

  Future<int> getidNotif() async {
    int idNotif = int.tryParse(await pref.read(key: 'idNotif') ?? '0') ?? 0;
    saveIdNotif(idNotif + 1);
    return idNotif;
  }
}

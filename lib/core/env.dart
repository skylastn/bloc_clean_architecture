import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_bo/main.dart';
import 'package:kiosk_bo/shared/notif/local_notification.dart';
import '../app/global/logic/local_session.dart';
import 'app_component.dart';
import 'dependency_injection.dart';

enum EnvType { development, production }

class Env {
  static late Env value;

  String get appName => '';

  String get baseUrl => '';

  String get logo => '';

  String get websocketUrl => '';

  String get vapidKey => '';

  EnvType get environmentType => EnvType.development;

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    initAllPackage();
    // if (kIsWeb || Platform.isWindows) {
    //   initAllPackage();
    //   return;
    // }
    // runZonedGuarded<Future<void>>(
    //   () async {
    //     initAllPackage();
    //   },
    //   (error, stack) {
    //     if (kIsWeb) {
    //       return;
    //     }
    //     // FirebaseCrashlytics.instance.recordError(error, stack);
    //   },
    // );
  }

  Future<void> initAllPackage() async {
    WidgetsFlutterBinding.ensureInitialized();
    inject.registerLazySingleton<LocalSession>(() => LocalSession());
    inject.get<LocalSession>().initLocalDatabase();
    if (!kIsWeb) {
      /// Set status bar icon color
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    }
    // await FirebaseTraits().init();
    await LocalNotification().init();
    await DenpendencyInjection.init();
    DenpendencyInjection.registerDependencies();
    // await initializeDateFormatting('id_ID', null);
    // await CapabilityProfile.ensureProfileLoaded(); //printer
    HttpOverrides.global = MyHttpOverrides();
    log('run here');
    runApp(AppComponent());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

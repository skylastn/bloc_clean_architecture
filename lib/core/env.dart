import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_bo/main.dart';
import 'package:kiosk_bo/shared/notif/local_notification.dart';
import '../app/global/logic/local_session.dart';
import '../shared/utils/router.dart';
import 'app_component.dart';
import 'dependency_injection.dart';
import 'firebase_traits.dart';

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
    if (kIsWeb || Platform.isWindows) {
      initAllPackage();
      return;
    }
    runZonedGuarded<Future<void>>(
      () async {
        initAllPackage();
      },
      (error, stack) {
        if (kIsWeb) {
          return;
        }
        // FirebaseCrashlytics.instance.recordError(error, stack);
      },
    );
  }

  initAllPackage() async {
    WidgetsFlutterBinding.ensureInitialized();
    services.registerLazySingleton<LocalSession>(() => LocalSession());
    await services.get<LocalSession>().initLocalDatabase();
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

    await LocalNotification().init();
    await FirebaseTraits().init();

    await DenpendencyInjection.init();
    // await initializeDateFormatting('id_ID', null);
    // await CapabilityProfile.ensureProfileLoaded(); //printer

    runApp(AppComponent());
  }

  void registerDependencies() {
    // services.registerLazySingleton<QueueCubit>(() => QueueCubit());
    services.registerLazySingleton<GoRouter>(() => router);
  }
}

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/dashboard_page.dart';
import '../../feature/auth/presentation/login/login_page.dart';
import '../../feature/auth/presentation/splash/splash_page.dart';

final router = GoRouter(
  initialLocation: SplashPage.routeName,
  observers: [FlutterSmartDialog.observer],
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: SplashPage.routeName,
      name: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: LoginPage.routeName,
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: DashboardPage.routeName,
      name: DashboardPage.routeName,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);

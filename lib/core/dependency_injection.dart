import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_bo/app/global/logic/auth_logic.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/repository/auth_repository.dart';
import 'package:kiosk_bo/main.dart';
import '../app/global/logic/global_data.dart';
import '../app/network/api_provider.dart';
import '../shared/utils/router.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    try {
      // Get.put(LocalController());
      inject.registerSingleton<GlobalLogic>(GlobalLogic());
      inject.registerLazySingleton<GoRouter>(() => router);
    } catch (e) {
      log('error Init Dependency $e');
    }
  }

  static MultiBlocProvider repositoryLogic(Widget child) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: inject.get<AuthLogic>())],
      child: child,
    );
  }

  static MultiRepositoryProvider repositoryProvider(Widget child) {
    return MultiRepositoryProvider(
      providers: [
        // Global Provider
        RepositoryProvider.value(value: inject.get<ApiProvider>()),

        // Repository
        RepositoryProvider.value(value: inject.get<AuthRepository>()),
      ],
      child: child,
    );
  }

  static void registerDependencies() {
    // inject.registerLazySingleton<QueueCubit>(() => QueueCubit());
    // Provider
    inject.registerFactory<ApiProvider>(() => ApiProvider());

    // Repository
    inject.registerFactory<AuthRepository>(() => AuthRepository());

    // Logic
    inject.registerSingleton<AuthLogic>(AuthLogic(AuthStateUnauthenticated()));
  }
}

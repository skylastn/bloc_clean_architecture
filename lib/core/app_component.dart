import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_bo/app/global/logic/auth_logic.dart';
import 'package:kiosk_bo/feature/auth/presentation/splash_page/splash_page.dart';
import '../main.dart';
import '../shared/scroll/custom_scroll_behavior.dart';
import '../shared/theme/theme.dart';

class AppComponent extends StatelessWidget {
  const AppComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return repositoryProvider(
      blocProvider(
        MaterialApp.router(
          scrollBehavior: CustomScrollBehavior(),
          title: dotenv.env['APP_NAME'] ?? 'Opet',
          theme: FoodAppTheme.getThemeData(),
          routerConfig: services<GoRouter>(),
          builder: FlutterSmartDialog.init(),
        ),
      ),
    );
  }

  Widget render(Widget child) {
    bool hasRedirected = false;

    return BlocListener<AuthLogic, AuthState>(
      listener: (context, state) {
        if (!hasRedirected && state is AuthStateUnauthenticated) {
          hasRedirected = true;
          // Redirect to logout page
          context.pushReplacementNamed(SplashPage.routeName);
        }

        if (!hasRedirected && state is AuthStateAuthenticated) {
          hasRedirected = true;
          // context.pushReplacementNamed(HomePage.routeName);
        }
      },
      child: child,
    );
  }

  MultiBlocProvider blocProvider(Widget child) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: services.get<AuthLogic>())],
      child: child,
    );
  }

  MultiRepositoryProvider repositoryProvider(Widget child) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider.value(value: services.get<AuthRepository>()),
        // RepositoryProvider.value(value: services.get<CartRepository>()),
      ],
      child: child,
    );
  }
}

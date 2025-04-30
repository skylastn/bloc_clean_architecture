import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_bo/feature/auth/presentation/login/login_page.dart';

import '../../../../app/global/logic/auth_logic.dart';
import '../../../../main.dart';
import '../../../../shared/widget/global_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authLogic = inject.get<AuthLogic>();

  @override
  void initState() async {
    init();
    super.initState();
  }

  Future<void> init() async {
    bool result = await _authLogic.checkAuth();
    if (!result) {
      inject.get<GoRouter>().pushNamed(LoginPage.routeName);
      return;
    }
    // inject.get<GoRouter>().pushNamed(name)
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScreen(
      body: Center(
        child: Image.asset('assets/kiosk/mascot.png', fit: BoxFit.contain),
      ),
    );
  }
}

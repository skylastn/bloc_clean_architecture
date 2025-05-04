import 'package:flutter/material.dart';
import 'package:kiosk_bo/feature/auth/presentation/login/login_page.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/dashboard_page.dart';

import '../../../../app/global/logic/auth_logic.dart';
import '../../../../main.dart';
import '../../../../shared/utils/navigation.dart';
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
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    bool result = await _authLogic.checkAuth();
    if (result) {
      // await _authLogic.initAfterLogin();
      Navigation.pushReplacementNamed(DashboardPage.routeName);
      return;
    }
    // TODO Check Token is Authorized From Backend
    // if(result){

    // }
    if (!result) {
      Navigation.pushReplacementNamed(LoginPage.routeName);
      return;
    }
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

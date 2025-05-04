import 'package:adaptive_sidebar/adaptive_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_bo/app/global/logic/auth_logic.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/dashboard_binding.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/order/order_page.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/widget/global_content_widget.dart';

import '../../../../shared/animation/floating_loading_animation.dart';
import '../../../../shared/theme/color_theme.dart';
import 'dashboard_logic.dart';
import 'dashboard_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    DashboardBinding.init();
    super.initState();
  }

  @override
  void dispose() {
    DashboardBinding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white, // ✅
      body: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => DashboardLogic())],
        child: BlocBuilder<DashboardLogic, DashboardState>(
          builder: (context, state) {
            final logic = context.read<DashboardLogic>();
            final state = logic.state;
            final authLogic = context.read<AuthLogic>();
            return AdaptiveSidebar(
              maxLargeSidebarSize: MediaQuery.of(context).size.width * 0.16,
              selectedColor: FoodAppColorTheme.primary,
              backgroundWidget: Container(
                color: Colors.orange[200],
                // child: Image.asset(
                //   'assets/kiosk/mascot.png',
                //   fit: BoxFit.contain,
                // ),
              ),
              icon: Icon(Icons.home),
              title: authLogic.user?.tenantName ?? '',
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              destinations: state is DashboardLoaded ? state.listNavbar : [],
              onPageChange: (index) => logic.navigateTab(index),
              body: Column(
                children: [
                  if (state is DashboardLoading || state is DashboardInitial)
                    const Center(
                      child: GlobalContentWidget(
                        title: "Initializing",
                        child: Center(child: FloatingLoadingAnimation()),
                      ),
                    ),
                  if (logic.isOnPage(TabType.order)) OrderPage(),
                ],
              ),
              footerDestinations: [
                SidebarDestination(label: 'Logout', icon: Icons.logout),
              ],
            );
          },
        ),
      ),
    );
  }
}

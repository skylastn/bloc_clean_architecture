import 'dart:developer';

import 'package:adaptive_sidebar/adaptive_sidebar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_bo/shared/extension/string_extension.dart';

import '../../../../app/global/logic/auth_logic.dart';
import '../../../../main.dart';
import '../../../../shared/utils/navigation.dart';
import '../../../auth/presentation/login/login_page.dart';
import '../../infrastructure/model/response/sub_navigation_response.dart';
import 'dashboard_state.dart';

class DashboardLogic extends Cubit<DashboardState> {
  DashboardLogic() : super(DashboardInitial()) {
    loadDashboard();
  }
  final authLogic = inject.get<AuthLogic>();
  List<SidebarDestination> listAllNavbar = [];

  Future<void> loadDashboard() async {
    emit(DashboardLoading());
    try {
      await authLogic.initAfterLogin();
      for (var element in authLogic.navigation) {
        for (SubNavigationResponse subNav in (element.subNavigations ?? [])) {
          final type = TabType.from(subNav.code ?? '');
          if (type == TabType.unknown) {
            continue;
          }
          listAllNavbar.add(
            SidebarDestination(
              label: type.name.capitalizeFirst,
              icon: type.getIcon,
            ),
          );
        }
      }
      emit(DashboardLoaded(index: 0, listNavbar: listAllNavbar));
    } catch (e) {
      log('error : ${e.toString()}');
      emit(DashboardError("Failed to load dashboard : ${e.toString()}"));
    }
  }

  Future<void> navigateTab(int index) async {
    log('change Tab : $index');
    if (state is! DashboardLoaded) {
      return;
      // logic.navigateTab(state.listNavbar[index].label);
    }
    var stateCubit = state as DashboardLoaded;
    if (index == stateCubit.index) {
      return;
    }
    if (index == stateCubit.listNavbar.length) {
      authLogic.logout();
      Navigation.pushReplacementNamed(LoginPage.routeName);
      return;
    }
    TabType type = TabType.from(
      stateCubit.listNavbar[index].label.toLowerCase(),
    );
    if (type == TabType.unknown) {
      return;
    }
    emit(DashboardLoaded(index: index, listNavbar: stateCubit.listNavbar));
  }

  // TabType getTabType() {
  //   if (state is! DashboardLoaded) {
  //     return TabType.unknown;
  //   }
  //   var stateCubit = state as DashboardLoaded;
  //   return TabType.from(
  //     stateCubit.listNavbar[stateCubit.index].label.toLowerCase(),
  //   );
  // }

  bool isOnPage(TabType type) {
    if (state is! DashboardLoaded) {
      return false;
    }
    var stateCubit = state as DashboardLoaded;
    return type ==
        TabType.from(
          stateCubit.listNavbar[stateCubit.index].label.toLowerCase(),
        );
  }
}

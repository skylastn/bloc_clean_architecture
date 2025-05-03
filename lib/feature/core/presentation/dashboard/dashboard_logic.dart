import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  //  navigation =

  // void loadDashboard() async {
  //   emit(DashboardLoading());
  //   try {
  //     // Simulate data fetching
  //     await Future.delayed(Duration(seconds: 2));
  //     const data = "Dashboard data loaded"; // Replace with actual data fetching
  //     emit(DashboardLoaded(data));
  //   } catch (e) {
  //     emit(DashboardError("Failed to load dashboard"));
  //   }
  // }

  void navigateTab() {}
}

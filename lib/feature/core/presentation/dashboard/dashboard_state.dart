// Define the states
import 'package:adaptive_sidebar/adaptive_sidebar.dart';
import 'package:flutter/material.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final int index;
  List<SidebarDestination> listNavbar;
  DashboardLoaded({required this.index, required this.listNavbar});
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

enum TabType {
  order('order'),
  unknown('unknown');

  final String name;
  const TabType(this.name);

  static TabType from(String name) {
    switch (name) {
      case 'order':
        return TabType.order;
      default:
        return TabType.unknown;
    }
  }

  IconData? get getIcon {
    switch (this) {
      case TabType.order:
        return Icons.local_shipping;
      default:
        return null;
    }
  }
}

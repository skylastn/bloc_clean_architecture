// Define the states
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final int index;

  DashboardLoaded({required this.index});
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

enum TabType {
  order('order');

  final String name;
  const TabType(this.name);

  static TabType from(String name) {
    switch (name) {
      case 'order':
        return TabType.order;
      default:
        return TabType.order;
    }
  }
}

import 'package:kiosk_bo/feature/core/infrastructure/model/response/order_response.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final int page;
  final int totalData;
  final String query;
  final List<OrderResponse> listOrder;
  OrderLoaded({
    required this.page,
    required this.query,
    required this.listOrder,
    required this.totalData,
  });
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}

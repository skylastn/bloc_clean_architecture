import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_bo/feature/core/application/marketplace_service.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/order/order_state.dart';

import '../../../../../app/global/logic/auth_logic.dart';
import '../../../../../main.dart';
import '../../../infrastructure/model/response/order_response.dart';

class OrderLogic extends Cubit<OrderState> {
  final authLogic = inject.get<AuthLogic>();
  int page = 1;
  List<int> listPage = [];
  String query = '';
  int offset = 0;
  List<OrderResponse> listOrder = [];
  final _service = MarketplaceService();
  final PaginatorController pageController = PaginatorController();

  OrderLogic() : super(OrderInitial()) {
    init();
  }

  void dispose() {
    pageController.dispose();
  }

  Future<void> init() async {
    fetchOrder();
  }

  Future<void> fetchOrder() async {
    emit(OrderLoading());
    try {
      // pageController.setRowsPerPage(10);

      var res = await _service.getListOrder(
        isAdmin: false,
        query: query,
        page: page,
        // tenantId: authLogic.tenantId,
      );
      res.fold(
        (l) {
          throw l.message;
        },
        (result) {
          log('cek data length : ${result.total}');

          if (listPage.isEmpty) {
            listPage = [page];
            listOrder.addAll(result.data ?? []);
          } else {
            if (!listPage.contains(page)) {
              listPage.add(page);
              listOrder.addAll(result.data ?? []);
            }
          }
          log('list order : ${listOrder.length}');
          emit(
            OrderLoaded(
              page: page,
              query: query,
              listOrder: listOrder,
              totalData: result.total ?? 0,
            ),
          );
        },
      );
    } catch (e) {
      emit(OrderError("Failed to load order : ${e.toString()}"));
    }
  }

  void onOffsetChanged(int offset) {
    this.offset = offset;
    page = pageFromOffset;
    log('page : $page');
    fetchOrder();
  }

  int get pageFromOffset {
    return offset ~/ 10 + 1;
  }
}

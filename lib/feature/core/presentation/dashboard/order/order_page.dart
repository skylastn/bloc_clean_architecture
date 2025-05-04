import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_bo/feature/core/infrastructure/model/response/order_response.dart';
import 'package:kiosk_bo/feature/core/presentation/dashboard/order/order_logic.dart';
import 'package:kiosk_bo/shared/widget/table/global_table_widget.dart';
import 'package:kiosk_bo/shared/animation/floating_loading_animation.dart';

import '../widget/global_content_widget.dart';
import 'order_state.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void dispose() {
    context.read<OrderLogic>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderLogic(),
      child: BlocBuilder<OrderLogic, OrderState>(
        builder: (context, state) {
          final logic = context.read<OrderLogic>();
          final state = logic.state;
          return GlobalContentWidget(
            title: 'Daftar Order Berlangsung',
            child: Column(
              children: [
                // Search bar
                // TextField(
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(Icons.search),
                //     hintText: 'Cari',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 16),
                _contentWidget(logic, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _contentWidget(OrderLogic logic, OrderState state) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (state is OrderLoading || state is OrderInitial)
            const Center(
              child: GlobalContentWidget(
                title: "Loading",
                child: Center(child: FloatingLoadingAnimation()),
              ),
            ),
          if (state is OrderError)
            Center(
              child: GlobalContentWidget(
                title: "Error",
                child: Text(state.message),
              ),
            ),
          if (state is OrderLoaded)
            AsyncPaginatedDataTable2(
              availableRowsPerPage: const [2, 5, 10, 30, 100],
              horizontalMargin: 20,
              checkboxHorizontalMargin: 12,
              columnSpacing: 0,
              wrapInCard: false,
              renderEmptyRowsInTheEnd: false,
              headingRowColor: WidgetStateColor.resolveWith(
                (states) => Colors.blue,
              ),

              headingRowDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border(
                  // top: BorderSide(color: Colors.grey.shade300, width: 1),
                  left: BorderSide(color: Colors.grey.shade300, width: 1),
                  right: BorderSide(color: Colors.grey.shade300, width: 1),
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              rowsPerPage: 10,
              // autoRowsToHeight: getCurrentRouteOption(context) == autoRows,
              minWidth: 800,
              fit: FlexFit.tight,
              border: TableBorder(
                // top: const BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.grey[300]!),
                left: BorderSide(color: Colors.grey[300]!),
                right: BorderSide(color: Colors.grey[300]!),
                verticalInside: BorderSide(color: Colors.grey[300]!),
                horizontalInside: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              onRowsPerPageChanged: (value) {},
              initialFirstRowIndex: logic.offset,
              onPageChanged: (rowIndex) {
                // log(rowIndex.toString());
                logic.onOffsetChanged(rowIndex);
              },
              // onSelectAll: _dessertsDataSource.selectAll,
              controller: logic.pageController,

              // hidePaginator: getCurrentRouteOption(context) == custPager,
              columns: [
                DataColumn2(label: Text('No.'), fixedWidth: 50),
                DataColumn(label: Center(child: Text('Nama'))),
                DataColumn(label: Center(child: Text('Nomor Antrian'))),
                DataColumn(label: Center(child: Text('Zona'))),
                DataColumn(label: Center(child: Text('Status'))),
                DataColumn2(
                  label: Center(child: Text('Aksi')),
                  fixedWidth: 100,
                ),
              ],
              empty: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.grey[200],
                  child: const Text('No data'),
                ),
              ),
              source: GlobalTableWidget<OrderResponse>(
                context,
                state.page,
                state.totalData,
                state.listOrder,
                (index, content, number) {
                  return DataRow2(
                    key: ValueKey(content.id),
                    cells: [
                      DataCell(Text('$number')),
                      DataCell(Center(child: Text(content.name ?? ''))),
                      DataCell(
                        Center(child: Text(content.getTransactionDisplay)),
                      ), // Nomor Antrian
                      DataCell(Center(child: Text(content.zoneName ?? ''))),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(Icons.edit, color: Colors.blue),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 3,
                              child: Text(content.status ?? ''),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.visibility, color: Colors.purple),
                            SizedBox(width: 8),
                            Icon(Icons.wechat, color: Colors.green),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          // if (getCurrentRouteOption(context) == custPager)
          //   Positioned(bottom: 16, child: CustomPager(_controller!)),
        ],
      ),
    );
  }
}

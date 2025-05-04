import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class GlobalTableWidget<T> extends AsyncDataTableSource {
  final BuildContext context;
  final List<T> data;
  final DataRow Function(int index, T content, int number) onRowBuild;
  final int selectedCount;
  final int totalData;

  GlobalTableWidget(
    this.context,
    this.selectedCount,
    this.totalData,
    this.data,
    this.onRowBuild,
  );

  @override
  int get rowCount => totalData;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => selectedCount;

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    // print("GET ROWS called with: $startIndex - $count");
    final sliced = data.skip(startIndex).take(count).toList();
    final rows =
        List<DataRow>.generate(sliced.length, (index) {
          // log("Generated index $selectedCount : $index");
          final item = sliced[index];
          return onRowBuild(index, item, startIndex + index + 1);
        }).toList();

    return AsyncRowsResponse(totalData, rows);
  }
}

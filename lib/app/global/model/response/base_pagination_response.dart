import 'package:kiosk_bo/shared/extension/string_extension.dart';

class BasePaginationResponse<T> {
  int? total;
  List<T>? data;

  BasePaginationResponse({this.total, this.data});

  factory BasePaginationResponse.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) fromMapT,
  ) {
    return BasePaginationResponse<T>(
      data: List<T>.from((map['data'] as List).map((item) => fromMapT(item))),
      total: map['total'].toString().toInt,
    );
  }
  Map<String, dynamic> toMap() => {
    "total": total,
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
  BasePaginationResponse<T> copyWith({int? total, List<T>? data}) =>
      BasePaginationResponse(
        total: total ?? this.total,
        data: data ?? this.data,
      );
  @override
  String toString() {
    return 'BasePaginationResponse{total: $total, data: $data}';
  }
}

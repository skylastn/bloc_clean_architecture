// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';

import 'package:kiosk_bo/shared/extension/string_extension.dart';

import 'detail_order_response.dart';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromMap(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  String? id;
  String? code;
  String? transactionId;
  String? tenantId;
  String? name;
  String? tenantName;
  String? zoneId;
  String? zoneName;
  String? areaId;
  String? areaName;
  int? serviceFee;
  int? totalFee;
  int? totalPrice;
  int? actualAmount;
  dynamic voucherId;
  dynamic voucherAmount;
  String? userId;
  String? status;
  dynamic timeout;
  bool? isTakeAway;
  bool? isSelfPick;
  String? orderNumber;
  String? transactionNumber;
  String? deliveryType;
  int? deliveryPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? transactionUpdatedAt;
  List<OrderDetailResponse>? orderDetails;

  OrderResponse({
    this.id,
    this.code,
    this.transactionId,
    this.tenantId,
    this.name,
    this.tenantName,
    this.zoneId,
    this.zoneName,
    this.areaId,
    this.areaName,
    this.serviceFee,
    this.totalFee,
    this.totalPrice,
    this.actualAmount,
    this.voucherId,
    this.voucherAmount,
    this.userId,
    this.status,
    this.timeout,
    this.isTakeAway,
    this.isSelfPick,
    this.orderNumber,
    this.transactionNumber,
    this.deliveryType,
    this.deliveryPrice,
    this.createdAt,
    this.updatedAt,
    this.transactionUpdatedAt,
    this.orderDetails,
  });

  OrderResponse copyWith({
    String? id,
    String? code,
    String? transactionId,
    String? tenantId,
    String? name,
    String? tenantName,
    dynamic zoneId,
    String? zoneName,
    String? areaId,
    String? areaName,
    int? serviceFee,
    int? totalFee,
    int? totalPrice,
    int? actualAmount,
    dynamic voucherId,
    dynamic voucherAmount,
    String? userId,
    String? status,
    dynamic timeout,
    bool? isTakeAway,
    bool? isSelfPick,
    String? orderNumber,
    String? transactionNumber,
    String? deliveryType,
    int? deliveryPrice,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? transactionUpdatedAt,
    List<OrderDetailResponse>? orderDetails,
  }) => OrderResponse(
    id: id ?? this.id,
    code: code ?? this.code,
    transactionId: transactionId ?? this.transactionId,
    tenantId: tenantId ?? this.tenantId,
    name: name ?? this.name,
    tenantName: tenantName ?? this.tenantName,
    zoneId: zoneId ?? this.zoneId,
    zoneName: zoneName ?? this.zoneName,
    areaId: areaId ?? this.areaId,
    areaName: areaName ?? this.areaName,
    serviceFee: serviceFee ?? this.serviceFee,
    totalFee: totalFee ?? this.totalFee,
    totalPrice: totalPrice ?? this.totalPrice,
    actualAmount: actualAmount ?? this.actualAmount,
    voucherId: voucherId ?? this.voucherId,
    voucherAmount: voucherAmount ?? this.voucherAmount,
    userId: userId ?? this.userId,
    status: status ?? this.status,
    timeout: timeout ?? this.timeout,
    isTakeAway: isTakeAway ?? this.isTakeAway,
    isSelfPick: isSelfPick ?? this.isSelfPick,
    orderNumber: orderNumber ?? this.orderNumber,
    transactionNumber: transactionNumber ?? this.transactionNumber,
    deliveryType: deliveryType ?? this.deliveryType,
    deliveryPrice: deliveryPrice ?? this.deliveryPrice,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    transactionUpdatedAt: transactionUpdatedAt ?? this.transactionUpdatedAt,
    orderDetails: orderDetails ?? this.orderDetails,
  );

  factory OrderResponse.fromMap(Map<String, dynamic> json) => OrderResponse(
    id: json["id"],
    code: json["code"],
    transactionId: json["transaction_id"],
    tenantId: json["tenant_id"],
    name: json["name"],
    tenantName: json["tenant_name"],
    zoneId: json["zone_id"],
    zoneName: json["zone_name"],
    areaId: json["area_id"],
    areaName: json["area_name"],
    serviceFee: json["service_fee"].toString().toInt,
    totalFee: json["total_fee"].toString().toInt,
    totalPrice: json["total_price"].toString().toInt,
    actualAmount: json["actual_amount"].toString().toInt,
    voucherId: json["voucher_id"],
    voucherAmount: json["voucher_amount"],
    userId: json["user_id"],
    status: json["status"],
    timeout: json["timeout"],
    isTakeAway: json["is_take_away"],
    isSelfPick: json["is_self_pick"],
    orderNumber: json["order_number"],
    transactionNumber: json["transaction_number"],
    deliveryType: json["delivery_type"],
    deliveryPrice: json["delivery_price"].toString().toInt,
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    transactionUpdatedAt:
        json["transaction_updated_at"] == null
            ? null
            : DateTime.parse(json["transaction_updated_at"]),
    orderDetails:
        json["order_details"] == null
            ? []
            : List<OrderDetailResponse>.from(
              json["order_details"]!.map((x) => x),
            ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "transaction_id": transactionId,
    "tenant_id": tenantId,
    "name": name,
    "tenant_name": tenantName,
    "zone_id": zoneId,
    "zone_name": zoneName,
    "area_id": areaId,
    "area_name": areaName,
    "service_fee": serviceFee,
    "total_fee": totalFee,
    "total_price": totalPrice,
    "actual_amount": actualAmount,
    "voucher_id": voucherId,
    "voucher_amount": voucherAmount,
    "user_id": userId,
    "status": status,
    "timeout": timeout,
    "is_take_away": isTakeAway,
    "is_self_pick": isSelfPick,
    "order_number": orderNumber,
    "transaction_number": transactionNumber,
    "delivery_type": deliveryType,
    "delivery_price": deliveryPrice,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "transaction_updated_at": transactionUpdatedAt?.toIso8601String(),
    "order_details":
        orderDetails == null
            ? []
            : List<OrderDetailResponse>.from(orderDetails!.map((x) => x)),
  };

  String get getTransactionDisplay {
    if (transactionNumber == null || transactionNumber!.isEmpty) {
      return "-";
    }

    int number = 0;
    if (zoneName != null) {
      final match = RegExp(r'\d+$').firstMatch(zoneName!);
      if (match != null) {
        number = int.parse(match.group(0)!);
      }
    }

    return '$number - $transactionNumber';
  }
}

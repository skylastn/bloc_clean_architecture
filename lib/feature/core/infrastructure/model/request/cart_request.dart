// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:kiosk_bo/shared/extension/string_extension.dart';

import '../cart_model.dart';
import '../response/detail_order_response.dart';

List<CartRequest> cartRequestFromJson(String str) => List<CartRequest>.from(
  json.decode(str).map((x) => CartRequest.fromJson(x)),
);

String cartRequestToJson(List<CartRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartRequest extends CartModel {
  final List<OrderDetailResponse> orderDetails;
  double serviceFee;
  double totalFee;
  String? areaId;
  // @override
  // final bool isTakeAway;
  // @override
  // final bool isSelfPick;
  CartRequest({
    required super.id,
    required super.code,
    required super.name,
    required super.tenantName,
    required super.zoneName,
    this.serviceFee = 0,
    this.totalFee = 0,
    required this.areaId,
    required super.totalPrice,
    required super.actualAmount,
    required super.userId,
    required super.status,
    // super.isTakeAway,
    // super.isSelfPick,
    super.zoneId,
    required super.tenantId,
    super.voucherId,
    super.voucherAmount,
    super.deliveryPrice,
    super.deliveryType,
    required this.orderDetails,
  });

  @override
  Map<String, dynamic> toJson() {
    // log(' log toJson TenantId : $tenantId');
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'tenant_id': tenantId,
      'tenant_name': tenantName,
      'zone_name': zoneName,
      'zone_id': zoneId,
      'area_id': areaId,
      'service_fee': serviceFee,
      'total_fee': totalFee,
      'total_price': totalPrice,
      'actual_amount': actualAmount,
      'voucher_id': voucherId,
      'voucher_amount': voucherAmount,
      'user_id': userId,
      'status': status,
      'timeout': timeout,
      'delivery_type': deliveryType.name,
      'delivery_price': deliveryPrice,
      // 'is_take_away': isTakeAway,
      // 'is_self_pick': isSelfPick,
      'order_details': List<dynamic>.from(orderDetails.map((x) => x.toMap())),
    };
  }

  factory CartRequest.fromJson(Map<String, dynamic> json) {
    // log(' log fromJson TenantId : ${json['tenant_id']}');
    return CartRequest(
      orderDetails: List<OrderDetailResponse>.from(
        (json['order_details'] ?? []).map<OrderDetailResponse>(
          (x) => OrderDetailResponse.fromMap(x as Map<String, dynamic>),
        ),
      ),
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      tenantId: json['tenant_id'] ?? '',
      tenantName: json['tenant_name'] ?? '',
      zoneId: json['zone_id'] ?? '',
      zoneName: json['zone_name'] ?? '',
      voucherId: json['voucher_id'] ?? '',
      voucherAmount: json['voucher_amount'].toString().toDouble,
      serviceFee: json['service_fee'].toString().toDouble,
      totalFee: json['total_fee'].toString().toDouble,
      totalPrice: json['total_price'].toString().toDouble,
      actualAmount: json['actual_amount'].toString().toDouble,
      userId: json['user_id'] ?? '',
      status: json['status'] ?? '',
      deliveryPrice: json['delivery_price'].toString().toDouble,
      deliveryType: DeliveryType.fromString(json['delivery_type']),
      areaId: json['area_id'],
      // isTakeAway:
      //     json['is_take_away'] != null ? json['is_take_away'] == true : null,
      // isSelfPick:
      //     json['is_self_pick'] != null ? json['is_self_pick'] == true : null,
    );
  }

  CartRequest copyWith({
    List<OrderDetailResponse>? orderDetails,
    double? serviceFee,
    double? totalFee,
    String? areaId,
  }) {
    return CartRequest(
      id: id,
      code: code,
      name: name,
      tenantName: tenantName,
      zoneName: zoneName,
      totalPrice: totalPrice,
      actualAmount: actualAmount,
      userId: userId,
      status: status,
      tenantId: tenantId,
      deliveryPrice: deliveryPrice,
      deliveryType: deliveryType,
      orderDetails:
          (orderDetails ?? this.orderDetails).map((e) => e.copyWith()).toList(),
      serviceFee: serviceFee ?? this.serviceFee,
      totalFee: totalFee ?? this.totalFee,
      areaId: areaId ?? this.areaId,
    );
  }
}

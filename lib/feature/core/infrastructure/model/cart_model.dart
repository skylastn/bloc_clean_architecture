import 'package:kiosk_bo/shared/extension/string_extension.dart';

class CartModel {
  final String id;
  final String code;
  final String name;
  final String tenantName;
  final String tenantId;
  String zoneName;
  String? zoneId;
  double totalPrice;
  double actualAmount;
  final String? voucherId;
  final double? voucherAmount;
  final String userId;
  final String status;
  final String? timeout;
  DeliveryType deliveryType;
  double? deliveryPrice;
  // bool? isTakeAway;
  // final bool? isSelfPick;
  final String? orderNumber;

  CartModel({
    required this.id,
    required this.code,
    required this.name,
    required this.tenantName,
    required this.tenantId,
    required this.zoneName,
    this.zoneId,
    required this.totalPrice,
    required this.actualAmount,
    this.voucherId,
    this.voucherAmount,
    required this.userId,
    required this.status,
    this.timeout,
    this.deliveryType = DeliveryType.selfPickup,
    required this.deliveryPrice,
    // this.isTakeAway,
    // this.isSelfPick,
    this.orderNumber,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? '',
      code: json['code'],
      name: json['name'],
      tenantName: json['tenant_name'],
      tenantId: json['tenant_id'],
      zoneName: json['zone_name'],
      zoneId: json['zone_id'] ?? '',
      totalPrice:
          json['total_price'] != null ? json['total_price'].toDouble() : 0.0,
      actualAmount: json['actual_amount'] != null
          ? json['actual_amount'].toDouble()
          : 0.0,
      voucherId: json['voucher_id'],
      voucherAmount: json['voucher_amount']?.toDouble(),
      userId: json['user_id'],
      status: json['status'],
      timeout: json['timeout'],
      deliveryType: DeliveryType.fromString(json['delivery_type']),
      deliveryPrice: json['delivery_price'].toString().toDouble,
      // isTakeAway:
      //     json['is_take_away'] != null ? json['is_take_away'] == true : null,
      // isSelfPick:
      //     json['is_self_pick'] != null ? json['is_self_pick'] == true : null,
      orderNumber: json['order_number'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'tenant_id': tenantId,
        'tenant_name': tenantName,
        'zone_name': zoneName,
        'zone_id': zoneId,
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
        'order_number': orderNumber,
      };
}

enum DeliveryType {
  selfPickup('self_pickup'),
  delivery('delivery');

  final String name;
  const DeliveryType(this.name);
  static DeliveryType fromString(String? name) {
    return DeliveryType.values.firstWhere((type) => type.name == name,
        orElse: () => DeliveryType.selfPickup);
  }

  String get title {
    switch (this) {
      case DeliveryType.selfPickup:
        return 'Self Pickup';
      case DeliveryType.delivery:
        return 'Delivery';
    }
  }
}

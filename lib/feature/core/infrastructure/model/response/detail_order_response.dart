// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final orderDetailResponse = orderDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kiosk_bo/shared/extension/string_extension.dart';

import 'menu_addon_response.dart';

OrderDetailResponse orderDetailResponseFromJson(String str) =>
    OrderDetailResponse.fromJson(json.decode(str));

String orderDetailResponseToJson(OrderDetailResponse data) =>
    json.encode(data.toJson());

class OrderDetailResponse {
  // String? uniqueId;
  String? menuId;
  String? menuName;
  int? quantity;
  String? discountId;
  double? discountAmount;
  double? packagingPrice;
  PackagingType packagingType;
  int? actualAmount;
  double? price;
  String? attachment;
  String? notes;
  List<MenuAddonResponse> orderDetailsAddons;

  OrderDetailResponse({
    // required this.uniqueId,
    required this.menuId,
    required this.menuName,
    required this.quantity,
    required this.discountId,
    required this.discountAmount,
    required this.actualAmount,
    required this.price,
    required this.attachment,
    required this.notes,
    required this.packagingPrice,
    required this.packagingType,
    required this.orderDetailsAddons,
  });

  OrderDetailResponse copyWith({
    // String? uniqueId,
    String? menuId,
    String? menuName,
    int? quantity,
    String? discountId,
    double? discountAmount,
    int? actualAmount,
    double? price,
    String? attachment,
    String? notes,
    double? packagingPrice,
    PackagingType packagingType = PackagingType.dineIn,
    List<MenuAddonResponse>? orderDetailsAddons,
  }) {
    return OrderDetailResponse(
      // uniqueId: uniqueId ?? this.uniqueId,
      menuId: menuId ?? this.menuId,
      menuName: menuName ?? this.menuName,
      quantity: quantity ?? this.quantity,
      discountId: discountId ?? this.discountId,
      discountAmount: discountAmount ?? this.discountAmount,
      actualAmount: actualAmount ?? this.actualAmount,
      price: price ?? this.price,
      attachment: attachment ?? this.attachment,
      notes: notes ?? this.notes,
      packagingPrice: packagingPrice ?? this.packagingPrice,
      packagingType: packagingType,
      orderDetailsAddons:
          (orderDetailsAddons ?? this.orderDetailsAddons)
              .map((e) => e.copyWith())
              .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'uniqueId': uniqueId,
      'menu_id': menuId,
      'menu_name': menuName,
      'quantity': quantity,
      'discount_id': discountId,
      'discount_amount': discountAmount,
      'actualAmount': actualAmount,
      'price': price,
      'attachment': attachment,
      'notes': notes,
      'packaging_price': packagingPrice,
      'packaging_type': packagingType.name,
      'order_details_addons': List<dynamic>.from(
        orderDetailsAddons.map((x) => x.toJson()),
      ),
    };
  }

  factory OrderDetailResponse.fromMap(Map<String, dynamic> json) {
    return OrderDetailResponse(
      // uniqueId: json["uniqueId"],
      menuId: json["menu_id"],
      menuName: json["menu_name"],
      quantity: json["quantity"].toString().toDouble.toInt(),
      discountId: json["discount_id"],
      discountAmount: json["discount_amount"].toString().toDouble,
      actualAmount: json["actual_amount"].toString().toDouble.toInt(),
      price: json["price"].toString().toDouble,
      attachment: json["attachment"],
      notes: json["notes"],
      packagingPrice: json["packaging_price"].toString().toDouble,
      packagingType: PackagingType.fromString(json["packaging_type"]),
      orderDetailsAddons: List<MenuAddonResponse>.from(
        (json["order_details_addons"] ?? []).map(
          (x) => MenuAddonResponse.fromJson(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailResponse.fromJson(String source) =>
      OrderDetailResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetailResponse(menuId: $menuId, menuName: $menuName, quantity: $quantity, discountId: $discountId, discountAmount: $discountAmount, actualAmount: $actualAmount, price: $price, attachment: $attachment, notes: $notes, packagingPrice: $packagingPrice, packagingType: $packagingType, orderDetailsAddons: $orderDetailsAddons)';
  }

  @override
  bool operator ==(covariant OrderDetailResponse other) {
    if (identical(this, other)) return true;

    return
    // other.uniqueId == uniqueId &&
    other.menuId == menuId &&
        other.menuName == menuName &&
        other.quantity == quantity &&
        other.discountId == discountId &&
        other.discountAmount == discountAmount &&
        other.actualAmount == actualAmount &&
        other.price == price &&
        other.attachment == attachment &&
        listEquals(other.orderDetailsAddons, orderDetailsAddons);
  }

  @override
  int get hashCode {
    return
    // uniqueId.hashCode ^
    menuId.hashCode ^
        menuName.hashCode ^
        quantity.hashCode ^
        discountId.hashCode ^
        discountAmount.hashCode ^
        actualAmount.hashCode ^
        price.hashCode ^
        attachment.hashCode ^
        orderDetailsAddons.hashCode;
  }
}

enum PackagingType {
  dineIn('dine_in'),
  takeAway('take_away');

  final String name;
  const PackagingType(this.name);

  static PackagingType fromString(String? name) {
    return PackagingType.values.firstWhere(
      (type) => type.name == name,
      orElse: () => PackagingType.dineIn,
    );
  }

  String get title {
    switch (this) {
      case PackagingType.dineIn:
        return 'Dine In';
      case PackagingType.takeAway:
        return 'Take Away';
    }
  }
}

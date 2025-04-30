// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:kiosk_bo/shared/extension/string_extension.dart';

class MenuAddonResponse {
  final String? id;
  final String? menuAddonId;
  final String? name;
  int? price;
  int? quantity;
  final String? groupAddons;
  final String? image;

  MenuAddonResponse({
    required this.id,
    this.menuAddonId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.groupAddons,
    this.image,
  });

  factory MenuAddonResponse.fromJson(Map<String, dynamic> json) {
    // log('cek Price : ${json['price'].toString()}');
    return MenuAddonResponse(
      id: json['id'] ?? '',
      menuAddonId: json['menu_addons_id'] ?? json['id'],
      name: json['name'] ?? json['menu_addons_name'] ?? '',
      price: json['price'].toString().toInt,
      groupAddons: json['group_addons'],
      image: json['attachment'],
      quantity: (json['quantity'] ?? 1).toString().toInt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'menu_addons_id': menuAddonId ?? id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'groupAddons': groupAddons,
      'image': image,
    };
  }

  MenuAddonResponse copyWith({
    String? id,
    String? menuAddonId,
    String? name,
    int? price,
    int? quantity,
    String? groupAddons,
    String? image,
  }) {
    return MenuAddonResponse(
      id: id ?? this.id,
      menuAddonId: menuAddonId ?? this.menuAddonId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      groupAddons: groupAddons ?? this.groupAddons,
      image: image ?? this.image,
    );
  }
}

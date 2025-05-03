// To parse this JSON data, do
//
//     final navigationResponse = navigationResponseFromJson(jsonString);

import 'dart:convert';

import 'sub_navigation_response.dart';

NavigationResponse navigationResponseFromJson(String str) =>
    NavigationResponse.fromJson(json.decode(str));

String navigationResponseToJson(NavigationResponse data) =>
    json.encode(data.toJson());

class NavigationResponse {
  String? id;
  String? name;
  String? code;
  String? roleId;
  dynamic tenantId;
  String? subRoleId;
  String? roleName;
  String? tenantName;
  String? subRoleName;
  List<SubNavigationResponse>? subNavigations;
  DateTime? updatedAt;
  String? mappingNavigationId;

  NavigationResponse({
    this.id,
    this.name,
    this.code,
    this.roleId,
    this.tenantId,
    this.subRoleId,
    this.roleName,
    this.tenantName,
    this.subRoleName,
    this.subNavigations,
    this.updatedAt,
    this.mappingNavigationId,
  });

  NavigationResponse copyWith({
    String? id,
    String? name,
    String? code,
    String? roleId,
    dynamic tenantId,
    String? subRoleId,
    String? roleName,
    String? tenantName,
    String? subRoleName,
    List<SubNavigationResponse>? subNavigations,
    DateTime? updatedAt,
    String? mappingNavigationId,
  }) => NavigationResponse(
    id: id ?? this.id,
    name: name ?? this.name,
    code: code ?? this.code,
    roleId: roleId ?? this.roleId,
    tenantId: tenantId ?? this.tenantId,
    subRoleId: subRoleId ?? this.subRoleId,
    roleName: roleName ?? this.roleName,
    tenantName: tenantName ?? this.tenantName,
    subRoleName: subRoleName ?? this.subRoleName,
    subNavigations: subNavigations ?? this.subNavigations,
    updatedAt: updatedAt ?? this.updatedAt,
    mappingNavigationId: mappingNavigationId ?? this.mappingNavigationId,
  );

  factory NavigationResponse.fromJson(Map<String, dynamic> json) =>
      NavigationResponse(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        roleId: json["role_id"],
        tenantId: json["tenant_id"],
        subRoleId: json["sub_role_id"],
        roleName: json["role_name"],
        tenantName: json["tenant_name"],
        subRoleName: json["sub_role_name"],
        subNavigations:
            json["sub_navigations"] == null
                ? []
                : List<SubNavigationResponse>.from(
                  json["sub_navigations"]!.map(
                    (x) => SubNavigationResponse.fromJson(x),
                  ),
                ),
        updatedAt:
            json["updated_at"] == null
                ? null
                : DateTime.parse(json["updated_at"]),
        mappingNavigationId: json["mapping_navigation_id"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "role_id": roleId,
    "tenant_id": tenantId,
    "sub_role_id": subRoleId,
    "role_name": roleName,
    "tenant_name": tenantName,
    "sub_role_name": subRoleName,
    "sub_navigations":
        subNavigations == null
            ? []
            : List<dynamic>.from(subNavigations!.map((x) => x.toJson())),
    "updated_at": updatedAt?.toIso8601String(),
    "mapping_navigation_id": mappingNavigationId,
  };
}

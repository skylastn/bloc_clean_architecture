class SubNavigationResponse {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? idNavigation;
  String? tenantId;
  String? code;
  String? subRoleId;

  SubNavigationResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.idNavigation,
    this.tenantId,
    this.code,
    this.subRoleId,
  });

  SubNavigationResponse copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? idNavigation,
    String? tenantId,
    String? code,
    String? subRoleId,
  }) => SubNavigationResponse(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    name: name ?? this.name,
    idNavigation: idNavigation ?? this.idNavigation,
    tenantId: tenantId ?? this.tenantId,
    code: code ?? this.code,
    subRoleId: subRoleId ?? this.subRoleId,
  );

  factory SubNavigationResponse.fromJson(
    Map<String, dynamic> json,
  ) => SubNavigationResponse(
    id: json["id"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    name: json["name"],
    idNavigation: json["id_navigation"],
    tenantId: json["tenant_id"],
    code: json["code"],
    subRoleId: json["sub_role_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "id_navigation": idNavigation,
    "tenant_id": tenantId,
    "code": code,
    "sub_role_id": subRoleId,
  };
}

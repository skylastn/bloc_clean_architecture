import 'dart:convert';

AuthResponse authResponseFromMap(String str) =>
    AuthResponse.fromMap(json.decode(str));

String authResponseToMap(AuthResponse data) => json.encode(data.toMap());

class AuthResponse {
  String? token;
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? roleId;
  String? tenantId;
  bool? status;
  bool? isDeleted;
  String? refreshToken;

  AuthResponse({
    this.token,
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.roleId,
    this.tenantId,
    this.status,
    this.isDeleted,
    this.refreshToken,
  });

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
    token: json["token"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    roleId: json["role_id"],
    tenantId: json["tenant_id"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
    "id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "role_id": roleId,
    "tenant_id": tenantId,
    "status": status,
    "is_deleted": isDeleted,
    "refresh_token": refreshToken,
  };

  AuthResponse copyWith({
    String? token,
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? roleId,
    String? tenantId,
    bool? status,
    bool? isDeleted,
    String? refreshToken,
  }) {
    return AuthResponse(
      token: token ?? this.token,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      roleId: roleId ?? this.roleId,
      tenantId: tenantId ?? this.tenantId,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthResponse(token: $token, id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, roleId: $roleId, tenantId: $tenantId, status: $status, isDeleted: $isDeleted, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(covariant AuthResponse other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.roleId == roleId &&
        other.tenantId == tenantId &&
        other.status == status &&
        other.isDeleted == isDeleted &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        roleId.hashCode ^
        tenantId.hashCode ^
        status.hashCode ^
        isDeleted.hashCode ^
        refreshToken.hashCode;
  }
}

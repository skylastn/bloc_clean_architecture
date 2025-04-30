// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'dart:convert';

UserResponse userResponseFromMap(String str) =>
    UserResponse.fromMap(json.decode(str));

String userResponseToMap(UserResponse data) => json.encode(data.toMap());

class UserResponse {
  String? id;
  String? tempUserId;
  String? name;
  String? phoneNumber;
  String? email;
  String? roleId;
  String? roleName;
  String? tenantId;
  String? tenantName;
  bool? status;
  String? cityId;
  String? cityName;
  String? virtualAccount;
  String? deviceToken;
  String? subRoleId;
  String? subRoleName;
  String? username;

  UserResponse({
    this.id,
    this.tempUserId,
    this.name,
    this.phoneNumber,
    this.email,
    this.roleId,
    this.roleName,
    this.tenantId,
    this.tenantName,
    this.status,
    this.cityId,
    this.cityName,
    this.virtualAccount,
    this.deviceToken,
    this.subRoleId,
    this.subRoleName,
    this.username,
  });

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
    id: json["id"],
    tempUserId: json["temp_user_id"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    roleId: json["role_id"],
    roleName: json["role_name"],
    tenantId: json["tenant_id"],
    tenantName: json["tenant_name"],
    status: json["status"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    virtualAccount: json["virtual_account"],
    deviceToken: json["device_token"],
    subRoleId: json["sub_role_id"],
    subRoleName: json["sub_role_name"],
    username: json["username"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "temp_user_id": tempUserId,
    "name": name,
    "phone_number": phoneNumber,
    "email": email,
    "role_id": roleId,
    "role_name": roleName,
    "tenant_id": tenantId,
    "tenant_name": tenantName,
    "status": status,
    "city_id": cityId,
    "city_name": cityName,
    "virtual_account": virtualAccount,
    "device_token": deviceToken,
    "sub_role_id": subRoleId,
    "sub_role_name": subRoleName,
    "username": username,
  };

  UserResponse copyWith({
    String? id,
    String? tempUserId,
    String? name,
    String? phoneNumber,
    String? email,
    String? roleId,
    String? roleName,
    String? tenantId,
    String? tenantName,
    bool? status,
    String? cityId,
    String? cityName,
    String? virtualAccount,
    String? deviceToken,
    String? subRoleId,
    String? subRoleName,
    String? username,
  }) {
    return UserResponse(
      id: id ?? this.id,
      tempUserId: tempUserId ?? this.tempUserId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      roleId: roleId ?? this.roleId,
      roleName: roleName ?? this.roleName,
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      status: status ?? this.status,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      virtualAccount: virtualAccount ?? this.virtualAccount,
      deviceToken: deviceToken ?? this.deviceToken,
      subRoleId: subRoleId ?? this.subRoleId,
      subRoleName: subRoleName ?? this.subRoleName,
      username: username ?? this.username,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserResponse(id: $id, tempUserId: $tempUserId, name: $name, phoneNumber: $phoneNumber, email: $email, roleId: $roleId, roleName: $roleName, tenantId: $tenantId, tenantName: $tenantName, status: $status, cityId: $cityId, cityName: $cityName, virtualAccount: $virtualAccount, deviceToken: $deviceToken, subRoleId: $subRoleId, subRoleName: $subRoleName, username: $username)';
  }

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tempUserId == tempUserId &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.roleId == roleId &&
        other.roleName == roleName &&
        other.tenantId == tenantId &&
        other.tenantName == tenantName &&
        other.status == status &&
        other.cityId == cityId &&
        other.cityName == cityName &&
        other.virtualAccount == virtualAccount &&
        other.deviceToken == deviceToken &&
        other.subRoleId == subRoleId &&
        other.subRoleName == subRoleName &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tempUserId.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        roleId.hashCode ^
        roleName.hashCode ^
        tenantId.hashCode ^
        tenantName.hashCode ^
        status.hashCode ^
        cityId.hashCode ^
        cityName.hashCode ^
        virtualAccount.hashCode ^
        deviceToken.hashCode ^
        subRoleId.hashCode ^
        subRoleName.hashCode ^
        username.hashCode;
  }
}

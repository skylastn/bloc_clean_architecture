import 'dart:convert';

class AuthRequest {
  String username;
  String? password;
  String? phone;
  bool? isEmail;
  String? mallId;
  String? deviceToken;
  AuthRequest({
    required this.username,
    required this.password,
    this.phone,
    this.isEmail,
    this.mallId,
    this.deviceToken,
  });

  AuthRequest copyWith({
    String? username,
    String? password,
    String? phone,
    bool? isEmail,
    String? mallId,
    String? deviceToken,
  }) {
    return AuthRequest(
      username: username ?? this.username,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      isEmail: isEmail ?? this.isEmail,
      mallId: mallId ?? this.mallId,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'phone': phone,
      'is_email': isEmail,
      'mall_id': mallId,
      'device_token': deviceToken,
    };
  }

  factory AuthRequest.fromMap(Map<String, dynamic> map) {
    return AuthRequest(
      username: map['username'] as String,
      password: map['password'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      isEmail: map['is_email'] != null ? map['is_email'] as bool : null,
      mallId: map['mall_id'] != null ? map['mall_id'] as String : null,
      deviceToken:
          map['device_token'] != null ? map['device_token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequest.fromJson(String source) =>
      AuthRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthRequest(username: $username, password: $password, phone: $phone, isEmail: $isEmail, mallId: $mallId, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(covariant AuthRequest other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.phone == phone &&
        other.isEmail == isEmail &&
        other.mallId == mallId &&
        other.deviceToken == deviceToken;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        isEmail.hashCode ^
        mallId.hashCode ^
        deviceToken.hashCode;
  }
}

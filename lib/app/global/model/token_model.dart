import 'dart:convert';

import 'package:flutter/widgets.dart';

class TokenModel {
  String? token;
  String? refreshToken;
  DateTime? updatedAt;
  TokenModel({this.token, this.refreshToken, this.updatedAt});

  TokenModel copyWith({
    ValueGetter<String?>? token,
    ValueGetter<String?>? refreshToken,
    ValueGetter<DateTime?>? updatedAt,
  }) {
    return TokenModel(
      token: token != null ? token() : this.token,
      refreshToken: refreshToken != null ? refreshToken() : this.refreshToken,
      updatedAt: updatedAt != null ? updatedAt() : this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'refresh_token': refreshToken,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'],
      refreshToken: map['refresh_token'],
      updatedAt:
          map['updated_at'] != null
              ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TokenModel(token: $token, refreshToken: $refreshToken, updatedAt: $updatedAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenModel &&
        other.token == token &&
        other.refreshToken == refreshToken &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode =>
      token.hashCode ^ refreshToken.hashCode ^ updatedAt.hashCode;
}

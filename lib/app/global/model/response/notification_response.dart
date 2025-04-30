import 'dart:convert';

class NotificationResponse {
  final NotificationResponseType? type;
  final String? id;
  final String? code;
  final NotificationResponseStatus? status;
  NotificationResponse({this.type, this.id, this.code, this.status});

  NotificationResponse copyWith({
    NotificationResponseType? type,
    String? id,
    String? code,
    NotificationResponseStatus? status,
  }) {
    return NotificationResponse(
      type: type ?? this.type,
      id: id ?? this.id,
      code: code ?? this.code,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type?.name,
      'id': id,
      'code': code,
      'status': status?.name,
    };
  }

  factory NotificationResponse.fromMap(Map<String, dynamic> map) {
    return NotificationResponse(
      type:
          map['type'] != null
              ? NotificationResponseType.fromString(map['type'])
              : null,
      id: map['id'] != null ? map['id'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      status:
          map['status'] != null
              ? NotificationResponseStatus.fromString(
                name: map['status'],
                type: map['type'],
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationResponse.fromJson(String source) =>
      NotificationResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotificationResponse(type: $type, id: $id, status: $status)';

  @override
  bool operator ==(covariant NotificationResponse other) {
    if (identical(this, other)) return true;

    return other.type == type && other.id == id && other.status == status;
  }

  @override
  int get hashCode => type.hashCode ^ id.hashCode ^ status.hashCode;
}

enum NotificationResponseType {
  order('ORDER'),
  transaction('TRANSACTION'),
  unknown("UNKNOWN");

  final String name;
  const NotificationResponseType(this.name);

  factory NotificationResponseType.fromString(String? name) {
    switch (name) {
      case 'ORDER':
        return NotificationResponseType.order;
      case 'TRANSACTION':
        return NotificationResponseType.transaction;
      default:
        return NotificationResponseType.unknown;
    }
  }
}

enum NotificationResponseStatus {
  masakMulai("MASAK MULAI"),
  masakSelesai("MASAK SELESAI"),
  sedangDiantar("SEDANG DIKIRIM/DIAMBIL"),
  sudahDiberikan("SUDAH DIBERIKAN"),
  sudahDiterima("SUDAH DITERIMA"),
  batalPesanan("BATAL PESANAN"),
  unpaid("UNPAID"),
  paid("PAID"),
  cancelled("CANCELLED"),
  refund("REFUND"),
  unknown("UNKNOWN");

  final String name;
  const NotificationResponseStatus(this.name);

  factory NotificationResponseStatus.fromString({String? name, String? type}) {
    var notificationFcmType = NotificationResponseType.fromString(type);
    if (notificationFcmType == NotificationResponseType.transaction) {
      switch (name) {
        case 'UNPAID':
          return NotificationResponseStatus.unpaid;
        case 'PAID':
          return NotificationResponseStatus.paid;
        case 'CANCELLED':
          return NotificationResponseStatus.cancelled;
        case 'REFUND':
          return NotificationResponseStatus.refund;
        default:
          return NotificationResponseStatus.unpaid;
      }
    }
    if (notificationFcmType == NotificationResponseType.order) {
      switch (name) {
        case 'MASAK MULAI':
          return NotificationResponseStatus.masakMulai;
        case 'MASAK SELESAI':
          return NotificationResponseStatus.masakSelesai;
        case 'SEDANG DIKIRIM/DIAMBIL':
          return NotificationResponseStatus.sedangDiantar;
        case 'SUDAH DIBERIKAN':
          return NotificationResponseStatus.sudahDiberikan;
        case 'SUDAH DITERIMA':
          return NotificationResponseStatus.sudahDiterima;
        case 'BATAL PESANAN':
          return NotificationResponseStatus.batalPesanan;
        default:
          return NotificationResponseStatus.masakMulai;
      }
    }
    return NotificationResponseStatus.unknown;
  }
}

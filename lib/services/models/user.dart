import 'dart:convert';

Courier courierFromJson(String str) => Courier.fromJson(json.decode(str));

String courierToJson(Courier data) => json.encode(data.toJson());

class Courier {
  Courier({
    required this.secretRoute,
    required this.id,
    required this.address,
    required this.addressJson,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.courierStatus,
    required this.courierRating,
    required this.courierActiveAt,
    required this.courierReservedAt,
    required this.courierBlockedFor,
    required this.courierType,
    required this.isActive,
    required this.isConfirmed,
    required this.isBooker,
  });

  String secretRoute;
  int id;
  dynamic address;
  dynamic addressJson;
  dynamic lat;
  dynamic lng;
  String name;
  String phone;
  String email;
  String role;
  String courierStatus;
  int courierRating;
  DateTime courierActiveAt;
  DateTime courierReservedAt;
  dynamic courierBlockedFor;
  String courierType;
  bool isActive;
  dynamic isConfirmed;
  dynamic isBooker;

  factory Courier.fromJson(Map<String, dynamic> json) => Courier(
        secretRoute: json["secret_route"],
        id: json["id"],
        address: json["address"],
        addressJson: json["address_json"],
        lat: json["lat"],
        lng: json["lng"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"],
        courierStatus: json["courier_status"],
        courierRating: json["courier_rating"],
        courierActiveAt: DateTime.parse(json["courier_active_at"]),
        courierReservedAt: DateTime.parse(json["courier_reserved_at"]),
        courierBlockedFor: json["courier_blocked_for"],
        courierType: json["courier_type"],
        isActive: json["is_active"],
        isConfirmed: json["is_confirmed"],
        isBooker: json["is_booker"],
      );

  Map<String, dynamic> toJson() => {
        "secret_route": secretRoute,
        "id": id,
        "address": address,
        "address_json": addressJson,
        "lat": lat,
        "lng": lng,
        "name": name,
        "phone": phone,
        "email": email,
        "role": role,
        "courier_status": courierStatus,
        "courier_rating": courierRating,
        "courier_active_at": courierActiveAt.toIso8601String(),
        "courier_reserved_at": courierReservedAt.toIso8601String(),
        "courier_blocked_for": courierBlockedFor,
        "courier_type": courierType,
        "is_active": isActive,
        "is_confirmed": isConfirmed,
        "is_booker": isBooker,
      };
}

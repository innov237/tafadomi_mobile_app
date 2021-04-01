// To parse this JSON data, do
//
//     final deliveryAddress = deliveryAddressFromJson(jsonString);

import 'dart:convert';

DeliveryAddress deliveryAddressFromJson(String str) =>
    DeliveryAddress.fromJson(json.decode(str));

String deliveryAddressToJson(DeliveryAddress data) =>
    json.encode(data.toJson());

class DeliveryAddress {
  DeliveryAddress({
    this.id,
    this.quater,
    this.phoneNumber,
    this.userId,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String quater;
  String phoneNumber;
  int userId;
  int cityId;
  DateTime createdAt;
  DateTime updatedAt;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        id: json["id"] == null ? null : json["id"],
        quater: json["quater"] == null ? null : json["quater"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        userId: json["user_id"] == null ? null : json["user_id"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "quater": quater == null ? null : quater,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "user_id": userId == null ? null : userId,
        "city_id": cityId == null ? null : cityId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

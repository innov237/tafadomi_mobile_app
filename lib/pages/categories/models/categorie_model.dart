// To parse this JSON data, do
//
//     final catrgorie = catrgorieFromJson(jsonString);

import 'dart:convert';

List<Categorie> categorieFromJson(String str) =>
    List<Categorie>.from(json.decode(str).map((x) => Categorie.fromJson(x)));

String categorieToJson(List<Categorie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categorie {
  Categorie({
    this.id,
    this.name,
    this.icon,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  int id;
  String name;
  String icon;
  String image;
  dynamic createdAt;
  dynamic updatedAt;
  List<dynamic> service;

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        service: List<dynamic>.from(json["service"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "service": List<dynamic>.from(service.map((x) => x)),
      };
}

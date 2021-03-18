import 'dart:convert';

Categorie categorieFromJson(String str) => Categorie.fromJson(json.decode(str));

String categorieToJson(Categorie data) => json.encode(data.toJson());

class Categorie {
  Categorie({
    this.currentPage,
    this.data,
  });

  int currentPage;
  List<Datum> data;

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.logoIcon,
    this.logoImage,
    this.service,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String logoIcon;
  String logoImage;
  List<dynamic> service;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        logoIcon: json["logo_icon"],
        logoImage: json["logo_image"],
        service: List<dynamic>.from(json["service"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "logo_icon": logoIcon,
        "logo_image": logoImage,
        "service": List<dynamic>.from(service.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final discountedService = discountedServiceFromJson(jsonString);

import 'dart:convert';

DiscountedService discountedServiceFromJson(String str) =>
    DiscountedService.fromJson(json.decode(str));

String discountedServiceToJson(DiscountedService data) =>
    json.encode(data.toJson());

class DiscountedService {
  DiscountedService({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory DiscountedService.fromJson(Map<String, dynamic> json) =>
      DiscountedService(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Datum {
  Datum({
    this.id,
    this.startedDate,
    this.endDate,
    this.reduction,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  int id;
  DateTime startedDate;
  DateTime endDate;
  String reduction;
  int serviceId;
  DateTime createdAt;
  DateTime updatedAt;
  Service service;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        startedDate: json["started_date"] == null
            ? null
            : DateTime.parse(json["started_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        reduction: json["reduction"] == null ? null : json["reduction"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "started_date": startedDate == null
            ? null
            : "${startedDate.year.toString().padLeft(4, '0')}-${startedDate.month.toString().padLeft(2, '0')}-${startedDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate == null
            ? null
            : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "reduction": reduction == null ? null : reduction,
        "service_id": serviceId == null ? null : serviceId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "service": service == null ? null : service.toJson(),
      };
}

class Service {
  Service({
    this.id,
    this.name,
    this.minimalPrice,
    this.categorieId,
    this.providerId,
    this.createdAt,
    this.updatedAt,
    this.logoIcon,
    this.logoImage,
  });

  int id;
  String name;
  String minimalPrice;
  int categorieId;
  int providerId;
  DateTime createdAt;
  DateTime updatedAt;
  String logoIcon;
  String logoImage;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        minimalPrice:
            json["minimal_price"] == null ? null : json["minimal_price"],
        categorieId: json["categorie_id"] == null ? null : json["categorie_id"],
        providerId: json["provider_id"] == null ? null : json["provider_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        logoIcon: json["logo_icon"] == null ? null : json["logo_icon"],
        logoImage: json["logo_image"] == null ? null : json["logo_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "minimal_price": minimalPrice == null ? null : minimalPrice,
        "categorie_id": categorieId == null ? null : categorieId,
        "provider_id": providerId == null ? null : providerId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "logo_icon": logoIcon == null ? null : logoIcon,
        "logo_image": logoImage == null ? null : logoImage,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  dynamic label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active == null ? null : active,
      };
}

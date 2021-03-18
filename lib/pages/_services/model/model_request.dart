// To parse this JSON data, do
//
//     final serviceRequest = serviceRequestFromJson(jsonString);

import 'dart:convert';

ServiceRequest serviceRequestFromJson(String str) =>
    ServiceRequest.fromJson(json.decode(str));

String serviceRequestToJson(ServiceRequest data) => json.encode(data.toJson());

class ServiceRequest {
  ServiceRequest({
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

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
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
    this.dataSolicitation,
    this.solicitationHour,
    this.daysRemaining,
    this.serviceId,
    this.userId,
    this.deliveryAddressId,
    this.timeSolicitation,
    this.createdAt,
    this.updatedAt,
    this.serviceUser,
    this.serviceAsk,
    this.delivryAddress,
    this.serviceProcessing,
  });

  int id;
  DateTime dataSolicitation;
  String solicitationHour;
  int daysRemaining;
  int serviceId;
  int userId;
  int deliveryAddressId;
  String timeSolicitation;
  DateTime createdAt;
  DateTime updatedAt;
  ServiceUser serviceUser;
  ServiceAsk serviceAsk;
  DelivryAddress delivryAddress;
  List<ServiceProcessing> serviceProcessing;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        dataSolicitation: json["data_solicitation"] == null
            ? null
            : DateTime.parse(json["data_solicitation"]),
        solicitationHour: json["solicitation_hour"] == null
            ? null
            : json["solicitation_hour"],
        daysRemaining:
            json["days_remaining"] == null ? null : json["days_remaining"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        deliveryAddressId: json["delivery_address_id"] == null
            ? null
            : json["delivery_address_id"],
        timeSolicitation: json["time_solicitation"] == null
            ? null
            : json["time_solicitation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        serviceUser: json["service_user"] == null
            ? null
            : ServiceUser.fromJson(json["service_user"]),
        serviceAsk: json["service_ask"] == null
            ? null
            : ServiceAsk.fromJson(json["service_ask"]),
        delivryAddress: json["delivry_address"] == null
            ? null
            : DelivryAddress.fromJson(json["delivry_address"]),
        serviceProcessing: json["service_processing"] == null
            ? null
            : List<ServiceProcessing>.from(json["service_processing"]
                .map((x) => ServiceProcessing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "data_solicitation": dataSolicitation == null
            ? null
            : "${dataSolicitation.year.toString().padLeft(4, '0')}-${dataSolicitation.month.toString().padLeft(2, '0')}-${dataSolicitation.day.toString().padLeft(2, '0')}",
        "solicitation_hour": solicitationHour == null ? null : solicitationHour,
        "days_remaining": daysRemaining == null ? null : daysRemaining,
        "service_id": serviceId == null ? null : serviceId,
        "user_id": userId == null ? null : userId,
        "delivery_address_id":
            deliveryAddressId == null ? null : deliveryAddressId,
        "time_solicitation": timeSolicitation == null ? null : timeSolicitation,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "service_user": serviceUser == null ? null : serviceUser.toJson(),
        "service_ask": serviceAsk == null ? null : serviceAsk.toJson(),
        "delivry_address":
            delivryAddress == null ? null : delivryAddress.toJson(),
        "service_processing": serviceProcessing == null
            ? null
            : List<dynamic>.from(serviceProcessing.map((x) => x.toJson())),
      };
}

class DelivryAddress {
  DelivryAddress({
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

  factory DelivryAddress.fromJson(Map<String, dynamic> json) => DelivryAddress(
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

class ServiceAsk {
  ServiceAsk({
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

  factory ServiceAsk.fromJson(Map<String, dynamic> json) => ServiceAsk(
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

class ServiceProcessing {
  ServiceProcessing({
    this.id,
    this.amout,
    this.status,
    this.serviceRequestId,
    this.providerId,
    this.deliveryAddressId,
    this.createdAt,
    this.updatedAt,
    this.provider,
  });

  int id;
  String amout;
  dynamic status;
  int serviceRequestId;
  int providerId;
  int deliveryAddressId;
  DateTime createdAt;
  DateTime updatedAt;
  Provider provider;

  factory ServiceProcessing.fromJson(Map<String, dynamic> json) =>
      ServiceProcessing(
        id: json["id"] == null ? null : json["id"],
        amout: json["amout"] == null ? null : json["amout"],
        status: json["status"],
        serviceRequestId: json["service_request_id"] == null
            ? null
            : json["service_request_id"],
        providerId: json["provider_id"] == null ? null : json["provider_id"],
        deliveryAddressId: json["delivery_address_id"] == null
            ? null
            : json["delivery_address_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "amout": amout == null ? null : amout,
        "status": status,
        "service_request_id":
            serviceRequestId == null ? null : serviceRequestId,
        "provider_id": providerId == null ? null : providerId,
        "delivery_address_id":
            deliveryAddressId == null ? null : deliveryAddressId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "provider": provider == null ? null : provider.toJson(),
      };
}

class Provider {
  Provider({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.citiesId,
    this.profilePicture,
    this.town,
    this.avatar,
  });

  int id;
  String name;
  String email;
  String phoneNumber;
  DateTime createdAt;
  DateTime updatedAt;
  int citiesId;
  String profilePicture;
  City town;
  String avatar;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        citiesId: json["cities_id"] == null ? null : json["cities_id"],
        profilePicture:
            json["profile_picture"] == null ? null : json["profile_picture"],
        town: json["town"] == null ? null : City.fromJson(json["town"]),
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "cities_id": citiesId == null ? null : citiesId,
        "profile_picture": profilePicture == null ? null : profilePicture,
        "town": town == null ? null : town.toJson(),
        "avatar": avatar == null ? null : avatar,
      };
}

class City {
  City({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class ServiceUser {
  ServiceUser({
    this.id,
    this.name,
    this.residence,
    this.prenom,
    this.telephone,
    this.citiesId,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.city,
    this.role,
  });

  int id;
  String name;
  String residence;
  String prenom;
  String telephone;
  int citiesId;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int roleId;
  City city;
  Role role;

  factory ServiceUser.fromJson(Map<String, dynamic> json) => ServiceUser(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        residence: json["residence"] == null ? null : json["residence"],
        prenom: json["prenom"] == null ? null : json["prenom"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        citiesId: json["cities_id"] == null ? null : json["cities_id"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        roleId: json["role_id"] == null ? null : json["role_id"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "residence": residence == null ? null : residence,
        "prenom": prenom == null ? null : prenom,
        "telephone": telephone == null ? null : telephone,
        "cities_id": citiesId == null ? null : citiesId,
        "email": email == null ? null : email,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "role_id": roleId == null ? null : roleId,
        "city": city == null ? null : city.toJson(),
        "role": role == null ? null : role.toJson(),
      };
}

class Role {
  Role({
    this.id,
    this.label,
    this.rank,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String label;
  int rank;
  dynamic createdAt;
  dynamic updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        label: json["label"] == null ? null : json["label"],
        rank: json["rank"] == null ? null : json["rank"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "label": label == null ? null : label,
        "rank": rank == null ? null : rank,
        "created_at": createdAt,
        "updated_at": updatedAt,
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

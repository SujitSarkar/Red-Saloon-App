// To parse this JSON data, do
//
//     final serviceList = serviceListFromJson(jsonString);

import 'dart:convert';

ServiceList serviceListFromJson(String str) => ServiceList.fromJson(json.decode(str));



class ServiceList {
  ServiceList({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  Data({
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

  int? currentPage;
  List<SList>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<SList>.from(json["data"].map((x) => SList.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );


}

class SList {
  SList({
    this.id,
    this.name,
    this.categoryId,
    this.price,
    this.photo,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.category,
  });

  int? id;
  String? name;
  String? categoryId;
  String? price;
  dynamic photo;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  Category? category;

  factory SList.fromJson(Map<String, dynamic> json) => SList(
    id: json["id"],
    name: json["name"],
    categoryId: json["category_id"],
    price: json["price"],
    photo: json["photo"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    category: Category.fromJson(json["category"]),
  );


}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  Name? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
  };
}

enum Name { BEAUTY_PRODUCT, HAIR_CARE }

final nameValues = EnumValues({
  "Beauty Product": Name.BEAUTY_PRODUCT,
  "Hair Care": Name.HAIR_CARE
});

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}

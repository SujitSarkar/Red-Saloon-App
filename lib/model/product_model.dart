// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));



class ProductListModel {
  ProductListModel({
    this.success,
    this.data,
  });

  bool? success;
  PModel? data;

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    success: json["success"],
    data: PModel.fromJson(json["data"]),
  );


}

class PModel {
  PModel({
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
  List<ProductData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  factory PModel.fromJson(Map<String, dynamic> json) => PModel(
    currentPage: json["current_page"],
    data: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
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

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.price,
    this.categoryId,
    this.photo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.category,
  });

  int? id;
  String? name;
  String? price;
  String? categoryId;
  String? photo;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? description;
  Category? category;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    categoryId: json["category_id"],
    photo: json["photo"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
    category: Category.fromJson(json["category"]),
  );


}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

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


}

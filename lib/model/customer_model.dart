// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerListModel customerModelFromJson(String str) => CustomerListModel.fromJson(json.decode(str));



class CustomerListModel {
  CustomerListModel({
    this.success,
    this.data,
  });

  bool? success;
  CModel? data;

  factory CustomerListModel.fromJson(Map<String, dynamic> json) => CustomerListModel(
    success: json["success"],
    data: CModel.fromJson(json["data"]),
  );


}

class CModel {
  CModel({
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
  List<CustomerModel>? data;
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

  factory CModel.fromJson(Map<String, dynamic> json) => CModel(
    currentPage: json["current_page"],
    data: List<CustomerModel>.from(json["data"].map((x) => CustomerModel.fromJson(x))),
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

class CustomerModel {
  CustomerModel({
    this.id,
    this.name,
    this.mobile,
    this.photo,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.membershipId,
    this.designationId,
    this.dob,
    this.joinDate,
    this.remark,
    this.designation,
  });

  int? id;
  String? name;
  String? mobile;
  String? photo;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? address;
  String? membershipId;
  String? designationId;
  DateTime? dob;
  DateTime? joinDate;
  dynamic? remark;
  Designation? designation;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    photo: json["photo"],
    email: json["email"] == null ? null : json["email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    address: json["address"] == null ? null : json["address"],
    membershipId: json["membership_id"] == null ? null : json["membership_id"],
    designationId: json["designation_id"],
    dob: DateTime.parse(json["dob"]),
    joinDate: DateTime.parse(json["join_date"]),
    remark: json["remark"],
    designation: Designation.fromJson(json["designation"]),
  );

}

class Designation {
  Designation({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
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

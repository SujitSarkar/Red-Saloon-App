// To parse this JSON data, do
//
//     final bookingListModel = bookingListModelFromJson(jsonString);

import 'dart:convert';

BookingListModel bookingListModelFromJson(String str) => BookingListModel.fromJson(json.decode(str));



class BookingListModel {
  BookingListModel({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory BookingListModel.fromJson(Map<String, dynamic> json) => BookingListModel(
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
  List<BList>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<BList>.from(json["data"].map((x) => BList.fromJson(x))),
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

class BList {
  BList({
    this.id,
    this.customerId,
    this.bookingDate,
    this.bookingTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.reference,
    this.advance,
    this.customer,
    this.bookingdetail,
  });

  int? id;
  String? customerId;
  DateTime? bookingDate;
  String? bookingTime;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic reference;
  String? advance;
  dynamic customer;
  List<Bookingdetail>? bookingdetail;

  factory BList.fromJson(Map<String, dynamic> json) => BList(
    id: json["id"],
    customerId: json["customer_id"],
    bookingDate: DateTime.parse(json["booking_date"]),
    bookingTime: json["booking_time"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reference: json["reference"],
    advance: json["advance"],
    customer: json["customer"],
    bookingdetail: List<Bookingdetail>.from(json["bookingdetail"].map((x) => Bookingdetail.fromJson(x))),
  );


}

class Bookingdetail {
  Bookingdetail({
    this.id,
    this.bookingId,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  int? id;
  String? bookingId;
  String? serviceId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic service;

  factory Bookingdetail.fromJson(Map<String, dynamic> json) => Bookingdetail(
    id: json["id"],
    bookingId: json["booking_id"],
    serviceId: json["service_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    service: json["service"],
  );


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

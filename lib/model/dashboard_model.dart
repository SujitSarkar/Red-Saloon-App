// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));



class DashboardModel {
  DashboardModel({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  Data({
    this.todayDob,
    this.tomorrowDob,
    this.totalCustomer,
    this.allBooking,
    this.todayBooking,
    this.productSale,
    this.serviceSale,
    this.stocks,
    this.advanceBooking,
    this.todayProductSale,
    this.todayServiceSale,
    this.todayPandingBooking,
  });

  List<AllBooking>? todayDob;
  List<AllBooking>? tomorrowDob;
  List<AllBooking>? totalCustomer;
  List<AllBooking>? allBooking;
  List<AllBooking>? todayBooking;
  List<Sale>? productSale;
  List<Sale>? serviceSale;
  List<Stock>? stocks;
  List<AdvanceBooking>? advanceBooking;
  List<Sale>? todayProductSale;
  List<Sale>? todayServiceSale;
  List<AllBooking>? todayPandingBooking;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    todayDob: List<AllBooking>.from(json["today_dob"].map((x) => AllBooking.fromJson(x))),
    tomorrowDob: List<AllBooking>.from(json["tomorrow_dob"].map((x) => AllBooking.fromJson(x))),
    totalCustomer: List<AllBooking>.from(json["total_customer"].map((x) => AllBooking.fromJson(x))),
    allBooking: List<AllBooking>.from(json["all_booking"].map((x) => AllBooking.fromJson(x))),
    todayBooking: List<AllBooking>.from(json["today_booking"].map((x) => AllBooking.fromJson(x))),
    productSale: List<Sale>.from(json["product_sale"].map((x) => Sale.fromJson(x))),
    serviceSale: List<Sale>.from(json["service_sale"].map((x) => Sale.fromJson(x))),
    stocks: List<Stock>.from(json["stocks"].map((x) => Stock.fromJson(x))),
    advanceBooking: List<AdvanceBooking>.from(json["advance_booking"].map((x) => AdvanceBooking.fromJson(x))),
    todayProductSale: List<Sale>.from(json["today_product_sale"].map((x) => Sale.fromJson(x))),
    todayServiceSale: List<Sale>.from(json["today_service_sale"].map((x) => Sale.fromJson(x))),
    todayPandingBooking: List<AllBooking>.from(json["today_panding_booking"].map((x) => AllBooking.fromJson(x))),
  );


}

class AdvanceBooking {
  AdvanceBooking({
    this.advance,
  });

  String? advance;

  factory AdvanceBooking.fromJson(Map<String, dynamic> json) => AdvanceBooking(
    advance: json["advance"],
  );


}

class AllBooking {
  AllBooking({
    this.id,
  });

  String? id;

  factory AllBooking.fromJson(Map<String, dynamic> json) => AllBooking(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class Sale {
  Sale({
    this.price,
  });

  String? price;

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "price": price == null ? null : price,
  };
}

class Stock {
  Stock({
    this.qty,
  });

  String? qty;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "qty": qty,
  };
}

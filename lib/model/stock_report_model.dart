// To parse this JSON data, do
//
//     final stockReportList = stockReportListFromJson(jsonString);

import 'dart:convert';

StockReportList stockReportListFromJson(String str) => StockReportList.fromJson(json.decode(str));


class StockReportList {
  StockReportList({
    this.success,
    this.data,
  });

  bool? success;
  List<StockReport>? data;

  factory StockReportList.fromJson(Map<String, dynamic> json) => StockReportList(
    success: json["success"],
    data: List<StockReport>.from(json["data"].map((x) => StockReport.fromJson(x))),
  );

}

class StockReport {
  StockReport({
    this.id,
    this.name,
    this.stocks,
  });

  int? id;
  String? name;
  List<Stock>? stocks;

  factory StockReport.fromJson(Map<String, dynamic> json) => StockReport(
    id: json["id"],
    name: json["name"],
    stocks: List<Stock>.from(json["stocks"].map((x) => Stock.fromJson(x))),
  );

}

class Stock {
  Stock({
    this.id,
    this.productId,
    this.qty,
  });

  int? id;
  String? productId;
  String? qty;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    id: json["id"],
    productId: json["product_id"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "qty": qty,
  };
}

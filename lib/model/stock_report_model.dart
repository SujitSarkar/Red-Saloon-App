// To parse this JSON data, do
//
//     final stockListModel = stockListModelFromJson(jsonString);

import 'dart:convert';

StockListModel stockListModelFromJson(String str) => StockListModel.fromJson(json.decode(str));



class StockListModel {
  StockListModel({
    this.success,
    this.data,
  });

  bool? success;
  List<StockM>? data;

  factory StockListModel.fromJson(Map<String, dynamic> json) => StockListModel(
    success: json["success"],
    data: List<StockM>.from(json["data"].map((x) => StockM.fromJson(x))),
  );


}

class StockM {
  StockM({
    this.id,
    this.name,
    this.stocks,
  });

  int? id;
  String? name;
  List<Stock>? stocks;

  factory StockM.fromJson(Map<String, dynamic> json) => StockM(
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

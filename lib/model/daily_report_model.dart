// To parse this JSON data, do
//
//     final dailyReportModel = dailyReportModelFromJson(jsonString);

import 'dart:convert';

DailyReportModel dailyReportModelFromJson(String str) => DailyReportModel.fromJson(json.decode(str));


class DailyReportModel {
  DailyReportModel({
    this.success,
    this.data,
  });

  bool? success;
  DailyM? data;

  factory DailyReportModel.fromJson(Map<String, dynamic> json) => DailyReportModel(
    success: json["success"],
    data: DailyM.fromJson(json["data"]),
  );


}

class DailyM {
  DailyM({
    this.paymenttype,
    this.salestype,
    this.total,
    this.expense,
    this.expensetype,
    this.purchase,
    this.supplierPayments,
    this.bookingAdvance,
    this.productbooking,
  });

  List<dynamic>? paymenttype;
  List<dynamic>? salestype;
  List<Total>? total;
  List<BookingAdvance>? expense;
  List<dynamic>? expensetype;
  List<BookingAdvance>? purchase;
  List<SupplierPayment>? supplierPayments;
  List<BookingAdvance>? bookingAdvance;
  List<BookingAdvance>? productbooking;

  factory DailyM.fromJson(Map<String, dynamic> json) => DailyM(
    paymenttype: List<dynamic>.from(json["paymenttype"].map((x) => x)),
    salestype: List<dynamic>.from(json["salestype"].map((x) => x)),
    total: List<Total>.from(json["total"].map((x) => Total.fromJson(x))),
    expense: List<BookingAdvance>.from(json["expense"].map((x) => BookingAdvance.fromJson(x))),
    expensetype: List<dynamic>.from(json["expensetype"].map((x) => x)),
    purchase: List<BookingAdvance>.from(json["purchase"].map((x) => BookingAdvance.fromJson(x))),
    supplierPayments: List<SupplierPayment>.from(json["supplier_payments"].map((x) => SupplierPayment.fromJson(x))),
    bookingAdvance: List<BookingAdvance>.from(json["booking_advance"].map((x) => BookingAdvance.fromJson(x))),
    productbooking: List<BookingAdvance>.from(json["productbooking"].map((x) => BookingAdvance.fromJson(x))),
  );


}

class BookingAdvance {
  BookingAdvance({
    this.amount,
  });

  dynamic amount;

  factory BookingAdvance.fromJson(Map<String, dynamic> json) => BookingAdvance(
    amount: json["amount"],
  );


}

class SupplierPayment {
  SupplierPayment({
    this.paidAmount,
  });

  dynamic paidAmount;

  factory SupplierPayment.fromJson(Map<String, dynamic> json) => SupplierPayment(
    paidAmount: json["paid_amount"],
  );


}

class Total {
  Total({
    this.saleTotal,
  });

  dynamic saleTotal;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    saleTotal: json["sale_total"],
  );


}

// To parse this JSON data, do
//
//     final dailyReportList = dailyReportListFromJson(jsonString);

import 'dart:convert';

DailyReportList dailyReportListFromJson(String str) => DailyReportList.fromJson(json.decode(str));


class DailyReportList {
  DailyReportList({
    this.success,
    this.data,
  });

  bool? success;
  DailyReport? data;

  factory DailyReportList.fromJson(Map<String, dynamic> json) => DailyReportList(
    success: json["success"],
    data: DailyReport.fromJson(json["data"]),
  );


}

class DailyReport {
  DailyReport({
    this.paymenttype,
    this.salestype,
    this.total,
    this.expense,
    this.expensetype,
    this.purchase,
    this.payments,
    this.bookingAdvance,
    this.productbooking,
  });

  List<dynamic>? paymenttype;
  List<dynamic>? salestype;
  List<Total>? total;
  List<BookingAdvance>? expense;
  List<dynamic>? expensetype;
  List<BookingAdvance>? purchase;
  List<Payment>? payments;
  List<BookingAdvance>? bookingAdvance;
  List<BookingAdvance>? productbooking;

  factory DailyReport.fromJson(Map<String, dynamic> json) => DailyReport(
    paymenttype: List<dynamic>.from(json["paymenttype"].map((x) => x)),
    salestype: List<dynamic>.from(json["salestype"].map((x) => x)),
    total: List<Total>.from(json["total"].map((x) => Total.fromJson(x))),
    expense: List<BookingAdvance>.from(json["expense"].map((x) => BookingAdvance.fromJson(x))),
    expensetype: List<dynamic>.from(json["expensetype"].map((x) => x)),
    purchase: List<BookingAdvance>.from(json["purchase"].map((x) => BookingAdvance.fromJson(x))),
    payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
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

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}

class Payment {
  Payment({
    this.paidAmount,
  });

  dynamic paidAmount;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    paidAmount: json["paid_amount"],
  );

  Map<String, dynamic> toJson() => {
    "paid_amount": paidAmount,
  };
}

class Total {
  Total({
    this.saleTotal,
  });

  dynamic saleTotal;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    saleTotal: json["sale_total"],
  );

  Map<String, dynamic> toJson() => {
    "sale_total": saleTotal,
  };
}

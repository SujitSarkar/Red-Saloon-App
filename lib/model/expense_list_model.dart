// To parse this JSON data, do
//
//     final expenseList = expenseListFromJson(jsonString?);

import 'dart:convert';

ExpenseList expenseListFromJson(String str) => ExpenseList.fromJson(json.decode(str));


class ExpenseList {
  ExpenseList({
    this.success,
    this.data,
  });

  bool? success;
  List<Expense>? data;

  factory ExpenseList.fromJson(Map<String?, dynamic> json) => ExpenseList(
    success: json["success"],
    data: List<Expense>.from(json["data"].map((x) => Expense.fromJson(x))),
  );
  
}

class Expense {
  Expense({
    this.id,
    this.name,
    this.amount,
    this.date,
    this.reference,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.expensetypeId,
    this.expensetype,
  });

  int? id;
  String? name;
  String? amount;
  DateTime? date;
  String? reference;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? expensetypeId;
  Expensetype? expensetype;

  factory Expense.fromJson(Map<String?, dynamic> json) => Expense(
    id: json["id"],
    name: json["name"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    reference: json["reference"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expensetypeId: json["expensetype_id"],
    expensetype: Expensetype.fromJson(json["expensetype"]),
  );
}

class Expensetype {
  Expensetype({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Expensetype.fromJson(Map<String, dynamic> json) => Expensetype(
    id: json["id"],
    name: json["name"],
  );
}

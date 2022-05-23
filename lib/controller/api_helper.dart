import 'dart:io';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:red_saloon/controller/public_controller.dart';
import 'package:red_saloon/model/service_list-model.dart';
import 'package:red_saloon/model/service_list-model.dart';

import '../model/customer_model.dart';
import '../model/customer_model.dart';
import '../model/customer_model.dart';
import '../model/customer_model.dart';
import '../model/daily_report_model.dart';
import '../model/expense_list_model.dart';
import '../model/login_model.dart';
import '../model/product_model.dart';
import '../model/service_list-model.dart';

import '../model/stock_report_model.dart';
import '../variables/variable.dart';

class ApiHelper {
  Future<bool> getLoginResponse(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse(Variables.baseUrl + 'auth/login'),
        body: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        PublicController.pc.loginModel.value =
            loginModelFromJson(response.body);
        PublicController.pc.pref!.setString('email', username); // auto login
        PublicController.pc.pref!.setString('password', password);
        print(PublicController.pc.loginModel.value.tokenType);
        return true;
      } else {
        showToast('Invalid email or password');
        return false;
      }
    } on SocketException {
      showToast('No internet connection');
      return false;
    } catch (error) {
      showToast(error.toString());
      return false;
    }
  }

  Future<void> getCustomerResponse() async {
    try {
      var response = await http.post(
        Uri.parse(Variables.baseUrl + 'customers'),
      );
      if (response.statusCode == 200) {
        PublicController.pc
            .customerListModel(customerModelFromJson(response.body));

        print(
            'Customers: ${PublicController.pc.customerListModel.value.data!.data}'); //postman stracture type

      } else {
        showToast('Customer get Failed');
      }
    } on SocketException {
      showToast('No internet connection');
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future<void> allProductResponse() async {
    //this funcaiton for product
    try {
      var response = await http.post(
        Uri.parse(Variables.baseUrl + 'products'),
      );

      if (response.statusCode == 200) {
        PublicController.pc
            .productListModel(productModelFromJson(response.body));
      } else {
        showToast('Failed to get product');
      }
    } on SocketException {
      showToast('No internet connection');
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future<void> allServiceResponse() async {
    //this funcaiton for product
    try {
      var response = await http.post(
        Uri.parse(Variables.baseUrl + 'services'),
      );

      if (response.statusCode == 200) {
        PublicController.pc.serviceList(serviceListFromJson(response.body));
      } else {
        showToast('Failed to get product');
      }
    } on SocketException {
      showToast('No internet connection');
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future<void> allExpenseList() async {
    try {
      var response = await http.post(Uri.parse(Variables.baseUrl + 'expenses'));

      if (response.statusCode == 200) {
        PublicController.pc.expenseList(expenseListFromJson(response.body));
      } else {
        showToast("Failed to get proudct");
      }
    } on SocketException {
      showToast("Network Failed");
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future<void> allBookingList() async {
    try {
      var response = await http.post(Uri.parse(Variables.baseUrl + 'bookings'));

      if (response.statusCode == 200) {
        PublicController.pc.expenseList(expenseListFromJson(response.body));
      } else {
        showToast("Failed to get proudct");
      }
    } on SocketException {
      showToast("Network Failed");
    } catch (error) {
      showToast(error.toString());
    }
  }


  Future<void> allStockReportList() async {
    try {
      var response = await http.post(Uri.parse(Variables.baseUrl + 'stock-report'));

      if (response.statusCode == 200) {
        PublicController.pc.stockReportListModel(stockReportListFromJson(response.body));
      } else {
        showToast("Failed to get proudct");
      }
    } on SocketException {
      showToast("Network Failed");
    } catch (error) {
      showToast(error.toString());
    }
  }


  Future<void> allDailyReportList() async {
    try {
      var response = await http.post(Uri.parse(Variables.baseUrl + 'daily-report'));

      if (response.statusCode == 200) {
        PublicController.pc.dailyReportList(dailyReportListFromJson(response.body));
      } else {
        showToast("Failed to get proudct");
      }
    } on SocketException {
      showToast("Network Failed");
    } catch (error) {
      showToast(error.toString());
    }
  }

}

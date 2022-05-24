import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:red_saloon/model/customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/booking_list_model.dart';
import '../model/daily_report_model.dart';
import '../model/daily_report_model.dart';
import '../model/dashboard_model.dart';
import '../model/expense_list_model.dart';
import '../model/login_model.dart';
import '../model/product_model.dart';
import '../model/service_list-model.dart';
import '../model/stock_report_model.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../variables/variable.dart';
import 'api_helper.dart';

class PublicController extends GetxController{
  static PublicController pc = Get.find();
  ApiHelper helper = ApiHelper();
  late SharedPreferences? pref;
  RxDouble size = 0.0.obs;
  RxBool loading=false.obs;
  RxDouble totalAsset=0.0.obs;
  RxDouble totalExpense=0.0.obs;
  Rx<LoginModel> loginModel = LoginModel().obs;
  Rx<CustomerListModel> customerListModel = CustomerListModel().obs;
  Rx<ProductListModel> productListModel=ProductListModel().obs;
  Rx<ServiceList> serviceList=ServiceList().obs;
  Rx<ExpenseList> expenseList=ExpenseList().obs;
  Rx<BookingListModel> bookingListModel=BookingListModel().obs;
  Rx<StockListModel> stockListModel=StockListModel().obs;
  Rx<DailyReportModel> dailyReportModel=DailyReportModel().obs;
  Rx<DashboardModel> dashboardModel=DashboardModel().obs;




  Future<void> initApp(BuildContext context) async {
    pref = await SharedPreferences.getInstance();
    if (MediaQuery.of(context).size.width<=500) {
      size.value=MediaQuery.of(context).size.width;
    } else {size(MediaQuery.of(context).size.height);}
    update();
    if (kDebugMode) {
      print('Initialized\n Size: ${size.value}');
    }
  }


  Future<void> login(String username, String password)async{
    loading.value=true;update();
    bool result = await helper.getLoginResponse(username, password);
    loading(false);update();
    if(result==true){
      showToast('Login Success');
      Get.offAll(()=> const HomePage());
    }
  }


  Future<void> logout()async{
    await pref!.clear();
    loading(false);
    update();
    Get.offAll(()=>const LoginPage());
  }

  Future<void> getAllCustomer()async{
    await helper.getCustomerResponse();
    update();
  }


  Future<void>getAllProduct()async{
    await helper.allProductResponse();
    update();
  }

  Future<void>getAllService()async{
    await helper.allServiceResponse();
    update();
  }

  Future<void>getExpenseList()async{
    await helper.allExpenseList();
    update();
  }

  Future<void>getBookingList()async{
    await helper.allBookingList();
    update();
  }

  Future<void>getStockReportModelList()async{
    await helper.allStockReportList();
    update();
  }

  Future<void>getDailyReportModelList()async{
    await helper.allDailyReportList();
    loading.value =false;
    update();
  }

  Future<void>getDashboardModelList()async{
    await helper.allDashboardList();
    loading.value =false;
    update();
  }


}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_saloon/pages/dashboard_page.dart';
import '../controller/public_controller.dart';
import '../model/home_menu_model.dart';
import '../pages/booking_page.dart';
import '../pages/customer_list_page.dart';
import '../pages/daily_report_page.dart';
import '../pages/expense_page.dart';
import '../pages/product_page.dart';
import '../pages/service_page.dart';
import '../pages/stock_report_page.dart';

import '../variables/config.dart';


class HomeMenuTile extends StatelessWidget {
  const HomeMenuTile({Key? key, required this.model}) : super(key: key);
  final HomeMenuModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(
      builder: (pc) {
        return  InkWell(
            onTap: ()async{
              if(model.title=='Customers'){
                Get.to(()=>const AllCustomerPage());
              }
              else if(model.title=="Products"){
                Get.to(()=>const AllProductPage());
              }
              else if (model.title=='Services'){
                Get.to(()=>const ServicePage());
              }
              else if (model.title=='Expense'){
                Get.to(()=> const AllExpensePage());
              }
              else if (model.title=='Booking'){
                Get.to(()=>const BookingPage());
              }
              else if (model.title=='Stocks'){
                Get.to(()=>const StockReportPage());
              }
              else if (model.title=='Daily Report'){
                Get.to(()=>const DailyReportpage());
              }
              else if (model.title=='Dashboard'){
                Get.to(()=>const DashboardPage());
              }

            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(dSize(.04)),
              decoration: BoxDecoration(
                  color: model.color.withOpacity(.15),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.05)))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(model.icon,color: model.color,size: dSize(.12)),
                    backgroundColor: Colors.white,
                    radius: dSize(.09),
                  ),
                  SizedBox(height: dSize(.02)),
                  Text(model.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontSize: dSize(.045)
                          ,fontWeight: FontWeight.w600))
                ],
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.05)))
        );
      }
    );
  }
}

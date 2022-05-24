import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_saloon/variables/config.dart';

import '../controller/public_controller.dart';

class DailyReportpage extends StatefulWidget {
  const DailyReportpage({Key? key}) : super(key: key);

  @override
  State<DailyReportpage> createState() => _DailyReportpageState();
}

class _DailyReportpageState extends State<DailyReportpage> {
  @override
  void initState(){
    super.initState();
    _initData();
  }
  Future<void> _initData()async{
    if(PublicController.pc.dailyReportModel.value.data==null){
      await PublicController.pc.getDailyReportModelList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(
      builder: (pc) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xffE6EDF9),
              body:pc.dailyReportModel.value.data!=null? ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(dSize(.010)),
                    child: Card(
                      child: Padding(
                        padding:  EdgeInsets.all(dSize(.010)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:  EdgeInsets.symmetric(
                                    vertical: dSize(.010), horizontal: dSize(.020)),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      spreadRadius: dSize(.05),
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "Sales",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: dSize(.05)),
                                )),
                            SizedBox(
                              height: dSize(.010),
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(.015)),
                              color: Color(0xffE6EDF9),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text("Total Sales"),
                                    Text("${pc.dailyReportModel.value.data!.total![0].saleTotal??'0'}")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(.015)),
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide.none,
                                bottom: BorderSide(color: Color(0xffE6EDF9)),
                                left: BorderSide(color: Color(0xffE6EDF9)),
                                right: BorderSide(color: Color(0xffE6EDF9)),
                              )),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Advance Booking"),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          left:
                                              BorderSide(color: Color(0xffE6EDF9)),
                                        )),
                                        child: Text("${pc.dailyReportModel.value.data!.bookingAdvance![0].amount??'0'}")),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox( height: dSize(.020)),
                  Padding(

                    padding: EdgeInsets.all(dSize(.010)),
                    child: Card(
                      color: Colors.white,

                      child: Padding(
                        padding:  EdgeInsets.all(dSize(.010)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Container(

                                padding:  EdgeInsets.symmetric(
                                    vertical: dSize(.010), horizontal: dSize(.020)),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: dSize(.05),
                                      blurRadius: dSize(.07),
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:  Text(
                                  "Expense",
                                  style: TextStyle(

                                      fontWeight: FontWeight.bold, fontSize: dSize(.05)),
                                )),
                             SizedBox(
                              height: dSize(.010),
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(0.02)),
                              color: Color(0xffE6EDF9),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text("Total Expense"),
                                    Text("${pc.dailyReportModel.value.data!.expense![0].amount??'0'}")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(.015)),
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide.none,
                                bottom: BorderSide(color: Color(0xffE6EDF9)),
                                left: BorderSide(color: Color(0xffE6EDF9)),
                                right: BorderSide(color: Color(0xffE6EDF9)),
                              )),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(0.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Purchase"),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          left:
                                              BorderSide(color: Color(0xffE6EDF9)),
                                        )),
                                        child: Text("${pc.dailyReportModel.value.data!.purchase![0].amount??'0'}")),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(.015)),
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide.none,
                                bottom: BorderSide(color: Color(0xffE6EDF9)),
                                left: BorderSide(color: Color(0xffE6EDF9)),
                                right: BorderSide(color: Color(0xffE6EDF9)),
                              )),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(0.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Suppliers Payment"),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          left:
                                              BorderSide(color: Color(0xffE6EDF9)),
                                        )),
                                        child: Text("৳ 0")),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: dSize(.015),),
                  Padding(

                    padding: EdgeInsets.all(dSize(.010)),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding:  EdgeInsets.all(dSize(.010)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Container(

                                padding:  EdgeInsets.symmetric(
                                    vertical: dSize(.010), horizontal: dSize(.020)),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: dSize(.05),
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:  Text(
                                  "Profit & Loss",
                                  style: TextStyle(

                                      fontWeight: FontWeight.bold, fontSize: dSize(.05)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(.015)),
                              color: Color(0xffE6EDF9),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Net Profit"),
                                    Text("৳ 0")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(dSize(.015)),
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide.none,
                                bottom: BorderSide(color: Color(0xffE6EDF9)),
                                left: BorderSide(color: Color(0xffE6EDF9)),
                                right: BorderSide(color: Color(0xffE6EDF9)),
                              )),
                              child: Padding(
                                padding:  EdgeInsets.only(right: dSize(.015)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Gross Profit"),
                                    Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          left:
                                              BorderSide(color: Color(0xffE6EDF9)),
                                        )),
                                        child: Text("৳ 0")),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ):const Center(child: CircularProgressIndicator(),)),
        );
      }
    );
  }
}

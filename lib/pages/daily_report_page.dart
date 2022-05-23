import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_saloon/variables/config.dart';

class DailyReportpage extends StatelessWidget {
  const DailyReportpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffE6EDF9),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(dSize(.010)),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              "Sales",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          color: Color(0xffE6EDF9),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Total Sales"),
                                Text("৳ 0")
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide.none,
                            bottom: BorderSide(color: Color(0xffE6EDF9)),
                            left: BorderSide(color: Color(0xffE6EDF9)),
                            right: BorderSide(color: Color(0xffE6EDF9)),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
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
              Padding(

                padding: EdgeInsets.all(dSize(.010)),
                child: Card(

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(

                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Text(
                              "Sales",
                              style: TextStyle(

                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          color: Color(0xffE6EDF9),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Total Sales"),
                                Text("৳ 0")
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide.none,
                            bottom: BorderSide(color: Color(0xffE6EDF9)),
                            left: BorderSide(color: Color(0xffE6EDF9)),
                            right: BorderSide(color: Color(0xffE6EDF9)),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
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
          )),
    );
  }
}

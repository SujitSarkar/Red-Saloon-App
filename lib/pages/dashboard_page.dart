import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_saloon/variables/config.dart';

import '../controller/public_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState(){
    super.initState();
    _initData();
  }
  Future<void> _initData()async{
    if(PublicController.pc.dashboardModel.value.data==null){
      await PublicController.pc.getDashboardModelList();
    }
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PublicController>(
      builder:(pc){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
            elevation: 0.0,
          ),
          body: _bodyUI(pc),
        );
      }
    );
  }

  Widget _bodyUI(PublicController pc)=>RefreshIndicator(
      onRefresh: ()async=> await pc.getDashboardModelList(),
      backgroundColor: Colors.white,
      child: pc.dashboardModel.value.data!=null ? ListView(
    padding: EdgeInsets.all(dSize(.04)),
    children: [

      ///Customer card
      Container(
        decoration: BoxDecoration(
          color: const Color(0xffFC3131),
          borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
        ),
        child: Row(
          children: [
            ///1st Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffD10808),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(dSize(.02)),
                  bottomLeft: Radius.circular(dSize(.02)),
                )
              ),
              child: Icon(Icons.supervised_user_circle_sharp,color: Colors.white,size: dSize(.12)),
            ),

            ///Second Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left:dSize(.04)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pc.dashboardModel.value.data!.totalCustomer![0].id??'0',style: TextStyle(color: Colors.white,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
                    Text('Customers',style: TextStyle(color: Colors.white,fontSize: dSize(.045),fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),

      ///Today Booking  card
      Container(
        decoration: BoxDecoration(
            color: const Color(0xffEF4F9A),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
        ),
        child: Row(
          children: [
            ///1st Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffBF1076),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    bottomLeft: Radius.circular(dSize(.02)),
                  )
              ),
              child: Icon(Icons.supervised_user_circle_sharp,color: Colors.white,size: dSize(.12)),
            ),

            ///Second Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left:dSize(.04)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pc.dashboardModel.value.data!.todayBooking![0].id??'0',style: TextStyle(color: Colors.white,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
                    Text('Today Booking',style: TextStyle(color: Colors.white,fontSize: dSize(.045),fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),
      //Today Pending Booking
      Container(
        decoration: BoxDecoration(
            color: const Color(0xffEF4F9A),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
        ),
        child: Row(
          children: [
            ///1st Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffBF1076),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    bottomLeft: Radius.circular(dSize(.02)),
                  )
              ),
              child: Icon(Icons.supervised_user_circle_sharp,color: Colors.white,size: dSize(.12)),
            ),

            ///Second Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left:dSize(.04)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pc.dashboardModel.value.data!.todayPandingBooking![0].id??'0',style: TextStyle(color: Colors.white,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
                    Text('Today Pending Booking',style: TextStyle(color: Colors.white,fontSize: dSize(.045),fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // Today Bookings
      SizedBox(height: dSize(.04)),
      //Today Birdthday;s
      Container(
        decoration: BoxDecoration(
            color: const Color(0xff843AB8),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.02)))
        ),
        child: Row(
          children: [
            ///1st Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xff672398),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dSize(.02)),
                    bottomLeft: Radius.circular(dSize(.02)),
                  )
              ),
              child: Icon(Icons.supervised_user_circle_sharp,color: Colors.white,size: dSize(.12)),
            ),

            ///Second Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left:dSize(.04)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pc.dashboardModel.value.data!.allBooking![0].id??'0',style: TextStyle(color: Colors.white,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
                    Text('Total Booking',style: TextStyle(color: Colors.white,fontSize: dSize(.045),fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //Tomorrow Birthday's
      SizedBox(height: dSize(.04)),
      //Today Product Sales

      //Today Product Sales
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFD4F4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              bottomLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02)),
              bottomRight: Radius.circular(dSize(.02)),
            )
        ),
        child: Column(
          children: [
            Text("Today Product Sale",style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Text(pc.dashboardModel.value.data!.productSale![0].price??'0',style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold))
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),
      //Today Product Sales
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFD4F4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              bottomLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02)),
              bottomRight: Radius.circular(dSize(.02)),
            )
        ),
        child: Column(
          children: [
            Text("Total Product Sales",style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Text(pc.dashboardModel.value.data!.todayProductSale![0].price??'0',style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold))
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),
      //Today Service Sales
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFD4F4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              bottomLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02)),
              bottomRight: Radius.circular(dSize(.02)),
            )
        ),
        child: Column(
          children: [
            Text("Today Service Sales",style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Text(pc.dashboardModel.value.data!.todayServiceSale![0].price??'0',style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold))
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),
      //Total Service Sales
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFD4F4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              bottomLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02)),
              bottomRight: Radius.circular(dSize(.02)),
            )
        ),
        child: Column(
          children: [
            Text("Advance Booking",style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Text(pc.dashboardModel.value.data!.advanceBooking![0].advance??'0',style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold))
          ],
        ),
      ),
      //Stocks
      SizedBox(height: dSize(.04)),
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFD4F4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              bottomLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02)),
              bottomRight: Radius.circular(dSize(.02)),
            )
        ),
        child: Column(
          children: [
            Text("Stocks",style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Text(pc.dashboardModel.value.data!.stocks![0].qty??'0',style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold))
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),
      //Todays Advance
      Container(
        padding: EdgeInsets.symmetric(horizontal: dSize(.05),vertical: dSize(.05)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFD4F4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dSize(.02)),
              bottomLeft: Radius.circular(dSize(.02)),
              topRight: Radius.circular(dSize(.02)),
              bottomRight: Radius.circular(dSize(.02)),
            )
        ),
        child: Column(
          children: [
            Text("Today Advance",style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Text(pc.dashboardModel.value.data!.advanceBooking![0].advance??'0',style: TextStyle(color: Colors.black87,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_upward)
          ],
        ),
      ),

    ]
  ):Center(child: const CircularProgressIndicator(),));
}

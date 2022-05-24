import 'package:flutter/material.dart';
import 'package:red_saloon/variables/config.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0.0,
      ),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI()=>ListView(
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
                    Text('+2',style: TextStyle(color: Colors.white,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
                    Text('Customers',style: TextStyle(color: Colors.white,fontSize: dSize(.045),fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: dSize(.04)),

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
                    Text('+2',style: TextStyle(color: Colors.white,fontSize: dSize(.05),fontWeight: FontWeight.bold)),
                    Text('Customers',style: TextStyle(color: Colors.white,fontSize: dSize(.045),fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]
  );
}

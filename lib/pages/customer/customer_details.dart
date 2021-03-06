// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/public_controller.dart';
// import '../../model/customer_model.dart';
// import '../../util/decoration.dart';
// import '../../variables/color_variable.dart';
// import '../../variables/config.dart';
// import '../../widgets/loading_widget.dart';
//
// class CustomerDetailsPage extends StatefulWidget {
//   const CustomerDetailsPage({Key? key,required this.model}) : super(key: key);
//   final CustomerModel model;
//
//   @override
//   State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
// }
//
// class _CustomerDetailsPageState extends State<CustomerDetailsPage> with SingleTickerProviderStateMixin{
//   TabController? _tabController;
//   @override
//   void initState(){
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PublicController>(builder: (pc){
//       return Stack(
//         children: [
//           Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(dSize(15)),
//               child: SafeArea(
//                 child: Row(
//                   children: [
//                     IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back,size: dSize(.07))),
//                     Expanded(
//                       child: TabBar(
//                         controller: _tabController,
//                         isScrollable: true,
//                         indicatorSize: TabBarIndicatorSize.label,
//                         indicator:const BoxDecoration(
//                             border: Border(bottom: BorderSide(width: 3.5, color: AllColor.primaryColor))),
//                         tabs: [
//                           Tab(child: Text('বিক্রয় বিবরণ',style: StDecoration.boldTextStyle.copyWith(fontSize: dynamicSize(.046)))),
//                           Tab(child: Text('পূর্ববর্তী বকেয়া পেমেন্ট বিবরণ',style: StDecoration.boldTextStyle)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             body: TabBarView(
//               controller: _tabController,
//               physics:const BouncingScrollPhysics(),
//               children: [
//                 SalesHistoryPage(model: widget.model),
//                 DuePaymentHistoryPage(model: widget.model),
//               ],
//             ),
//           ),
//           if(pc.loading.value) const LoadingWidget()
//         ],
//       );
//     });
//   }
// }
//

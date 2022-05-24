import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:red_saloon/controller/public_controller.dart';
import 'package:red_saloon/variables/color_variable.dart';

import '../util/booking_tile.dart';
import '../util/decoration.dart';
import '../util/expense_list_tile.dart';
import '../variables/config.dart';
import '../widgets/color_button.dart';
import '../widgets/loading_widget.dart';
import '../widgets/text_field_tile.dart';




class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _bookingName = TextEditingController(text: '');
  final TextEditingController _bookingbarCode = TextEditingController(text: '');
  final TextEditingController _bookingpartyName = TextEditingController(text: '');

  @override
  void initState(){
    super.initState();
    _initData();
  }

  Future<void> _initData()async{
    if(PublicController.pc.bookingListModel.value.data==null){
      await PublicController.pc.getBookingList();
    }
  }




  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc){
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('Expense', style: StDecoration.boldTextStyle,),
              backgroundColor: AllColor.appBgColor,
              elevation: 0.0,
              titleSpacing: 0.0,
              iconTheme: IconThemeData(color: Colors.grey.shade800),
              actions: [
                IconButton(onPressed: () async{
                  pc.loading(true);pc.update();
                  await pc.getBookingList();
                  pc.loading(false);pc.update();
                }, icon: Icon(LineAwesomeIcons.alternate_redo,size: dSize(.065),)),
                IconButton(onPressed: (){
                  _showSearchDialog(pc);
                }, icon: Icon(LineAwesomeIcons.search,size: dSize(0.065),))
              ],
            ),
            body: _bodyUI(pc),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(vertical: dSize(.02),horizontal: dSize(.05)),
              decoration: BoxDecoration(
                  color: AllColor.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dSize(.03)),
                      topRight: Radius.circular(dSize(.03))
                  )
              ),
              child: Row(
                children: [
                  Text("Total Booking",style: StDecoration.boldTextStyle.copyWith(color: Colors.white),),
                  Expanded(child: Text('${pc.bookingListModel.value.data!=null? pc.bookingListModel.value.data!.data!.length: '0'}',textAlign: TextAlign.end,
                    style: StDecoration.boldTextStyle.copyWith(color: Colors.white),))
                ],
              ),
            ),
          ),
          if(pc.loading.value)const LoadingWidget()

        ],
      );
    });
  }

  Widget _bodyUI(PublicController pc)=>RefreshIndicator(
      onRefresh: ()async=> await pc.getBookingList(),
      backgroundColor: Colors.white,
      child: pc.bookingListModel.value.data!=null
          ?ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.02)),
          itemCount: pc.bookingListModel.value.data!.data!.length,
          itemBuilder: (context,index)=>BookingListTile(bModel: pc.bookingListModel.value.data!.data![index]),
          separatorBuilder: (context,index)=>SizedBox(height: dSize(0.04))):Center(child: CircularProgressIndicator(),)



  );

  void _showSearchDialog(PublicController pc){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=>AlertDialog(
          scrollable: true,
          insetPadding: EdgeInsets.all(dSize(.04)),
          contentPadding: EdgeInsets.all(dSize(.04)),
          title: Text('পণ্য অনুসন্ধান করুন',textAlign: TextAlign.center,style: StDecoration.boldTextStyle),
          content: StatefulBuilder(
              builder: (context,setState) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [

                      TextFieldTile(controller:  _bookingName, labelText: 'পণ্যের নাম',textCapitalization: TextCapitalization.words),
                      SizedBox(height: dSize(.06)),
                      TextFieldTile(controller:  _bookingbarCode, labelText: 'পণ্যের বার কোড'),
                      SizedBox(height: dSize(.06)),
                      TextFieldTile(controller:  _bookingpartyName, labelText: 'পার্টির নাম'),
                      SizedBox(height: dSize(.06)),

                      !pc.loading.value
                          ?ColorTextButton(
                        onPressed: ()async{
                          // setState((){});
                          // Map<String,String> map = {
                          //   'product_name':_productName.text,
                          //   'bar_code': _barCode.text,
                          //   'party_name': _partyName.text
                          // };
                          // await pc.searchProduct(map);
                          // setState((){});
                          // Get.back();
                        },
                        text: 'অনুসন্ধান করুন',
                        minimumSize: Size(dSize(.45),dSize(.1)),
                      ):const CircularProgressIndicator()
                    ],
                  ),
                );
              }
          ),
        ));
  }


}

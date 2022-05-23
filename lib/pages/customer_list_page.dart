import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../controller/public_controller.dart';
import '../model/customer_model.dart';

import '../util/customer_list_tile.dart';
import '../variables/color_variable.dart';
import '../variables/config.dart';
import '../variables/variable.dart';
import '../widgets/decoration.dart';
import '../widgets/loading_widget.dart';

class AllCustomerPage extends StatefulWidget {
  const AllCustomerPage({Key? key}) : super(key: key);

  @override
  State<AllCustomerPage> createState() => _AllCustomerPageState();
}

class _AllCustomerPageState extends State<AllCustomerPage> {

  final TextEditingController _name = TextEditingController(text: '');
  final TextEditingController _phone = TextEditingController(text: '');
  final TextEditingController _customerId = TextEditingController(text: '');
  CustomerModel? _customerModel;

  @override
  void initState(){
    super.initState();
    _initData();
  }
  Future<void> _initData()async{
    if(PublicController.pc.customerListModel.value.data==null
        ||PublicController.pc.customerListModel.value.data!.data!.isEmpty){
      await PublicController.pc.getAllCustomer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(builder: (pc){
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('ক্রেতা', style:StDecoration.boldTextStyle),
              backgroundColor: AllColor.appBgColor,
              elevation: 0.0,
              titleSpacing: 0.0,
              iconTheme: IconThemeData(color: Colors.grey.shade800),
              actions: [
                IconButton(onPressed: ()async{
                  pc.loading(true);pc.update();
                  await pc.getAllCustomer();
                  pc.loading(false);pc.update();
                }, icon: Icon(LineAwesomeIcons.alternate_redo,size: dSize(.065))),
                IconButton(onPressed: (){
                  // _showSearchDialog(pc);
                  }, icon: Icon(LineAwesomeIcons.search,size: dSize(.065)))
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
                ),
              ),
              child: Row(
                children: [
                  Text('মোট কাস্টমার:',style: StDecoration.boldTextStyle.copyWith(color:Colors.white)),
                  Expanded(child: Text('${pc.customerListModel.value.data!=null? pc.customerListModel.value.data!.data!.length:''}',textAlign: TextAlign.end,
                      style: StDecoration.boldTextStyle.copyWith(color:Colors.white)))
                ],
              ),
            ),
          ),
          if(pc.loading.value) const LoadingWidget()
        ],
      );
    });
  }

  Widget _bodyUI(PublicController pc)=>RefreshIndicator(
    onRefresh: ()async=> await pc.getAllCustomer(),
    backgroundColor: Colors.white,
    child: pc.customerListModel.value.data!=null
        ?ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.02)),
        itemCount: pc.customerListModel.value.data!.data!.length,
        itemBuilder: (context, index)=> CustomerListTile(model: pc.customerListModel.value.data!.data![index]),
        separatorBuilder: (context, index)=>SizedBox(height: dSize(.04))):Container(),
  );

  // void _showSearchDialog(PublicController pc){
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context)=>AlertDialog(
  //         scrollable: true,
  //         insetPadding: EdgeInsets.all(dSize(.04)),
  //         contentPadding: EdgeInsets.all(dSize(.04)),
  //         title: Text('ক্রেতা অনুসন্ধান করুন',textAlign: TextAlign.center,style: StDecoration.boldTextStyle),
  //         content: StatefulBuilder(
  //             builder: (context,setState) {
  //               return SizedBox(
  //                 width: double.infinity,
  //                 child: Column(
  //                   children: [
  //
  //                     Container(
  //                       padding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.025)),
  //                       decoration: BoxDecoration(
  //                           borderRadius: const BorderRadius.all(Radius.circular(5)),
  //                           border: Border.all(color: Colors.blueGrey,width: .5)
  //                       ),
  //                       child: DropdownButtonHideUnderline(
  //                         child: DropdownButton<CustomerModel>(
  //                           value: _customerModel,
  //                           icon: Icon(LineAwesomeIcons.angle_down,size: dSize(.04)),
  //                           elevation: 16,
  //                           dropdownColor: Colors.white,
  //                           isExpanded: true,
  //                           isDense: true,
  //                           hint: const Text('কোম্পানি নির্বাচন করুন'),
  //                           onChanged: (model) {
  //                             setState(() {_customerModel = model;});
  //                             setState((){});
  //                           },
  //                           items: pc.customerModel.value.data!.data!
  //                               .map<DropdownMenuItem<CustomerModel>>((CustomerModel model) {
  //                             return DropdownMenuItem<CustomerModel>(
  //                               value: model,
  //                               child: Text(model.companyName!,style: StDecoration.normalTextStyle),
  //                             );
  //                           }).toList(),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(height: dSize(.06)),
  //
  //                     TextFieldTile(controller:  _name, labelText: 'নাম',textCapitalization: TextCapitalization.words),
  //                     SizedBox(height: dSize(.06)),
  //                     TextFieldTile(controller:  _phone, labelText: 'ফোন নাম্বার',textInputType: TextInputType.number),
  //                     SizedBox(height: dSize(.06)),
  //                     TextFieldTile(controller:  _customerId, labelText: 'ক্রেতার আইডি'),
  //                     SizedBox(height: dSize(.06)),
  //
  //                     !pc.loading.value
  //                         ?ColorTextButton(
  //                       onPressed: ()async{
  //                         if(_phone.text.isNotEmpty || _name.text.isNotEmpty || _companyModel!=null || _customerId.text.isNotEmpty){
  //                           setState((){});
  //                           Map<String,String> map = {
  //                             'name':_name.text,
  //                             'phone': _phone.text,
  //                             'company_name': _companyModel!=null?_companyModel!.id.toString():'',
  //                             'customer_id': _customerId.text
  //                           };
  //                           await pc.searchCustomer(map);
  //                           setState((){});
  //                           Get.back();
  //                         }else{showToast('ফিল্ড পূরন করুন');}
  //                       },
  //                       text: 'অনুসন্ধান করুন',
  //                       minimumSize: Size(dynamicSize(.45),dynamicSize(.1)),
  //                     ):const CircularProgressIndicator()
  //                   ],
  //                 ),
  //               );
  //             }
  //         ),
  //       ));
  // }
}


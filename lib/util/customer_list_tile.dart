import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../model/customer_model.dart';
import '../variables/color_variable.dart';
import '../variables/config.dart';
import '../widgets/decoration.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({Key? key,required this.model}) : super(key: key);
  final CustomerModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // Get.to(()=> CustomerDetailsPage(model: model));
      },
      child: Container(
        padding: EdgeInsets.all(dSize(.02)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Image
                Container(
                  height: dSize(.13),
                  width: dSize(.13),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AllColor.primaryColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(dSize(.1))),
                    child: CachedNetworkImage(
                      imageUrl: model.photo??'',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CupertinoActivityIndicator(color: Colors.white,radius: dSize(.03)),
                      errorWidget: (context, url, error) => Icon(LineAwesomeIcons.exclamation,color:Colors.white,size: dSize(.07)),
                    ),
                  )
                ),
                SizedBox(width: dSize(.03)),

                Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: StDecoration.normalTextStyle.copyWith(fontSize: dSize(.035)),
                        children: [
                          TextSpan(text: '${model.name??''}\n',style: StDecoration.boldTextStyle.copyWith(color: AllColor.primaryColor)),
                           model.mobile!=null
                        ?TextSpan(text: model.mobile??'')
                        :const TextSpan(text: 'Not a number'),


                        ],
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: dSize(.02)),

            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: StDecoration.normalTextStyle,
                children: [
                  const TextSpan(text: 'Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.name}\n'),
                  const TextSpan(text: 'Mobile: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.mobile}\n'),
                  const TextSpan(text: 'Email ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.email}'),
                  const TextSpan(text: 'Address ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.address}'),
                  const TextSpan(text: 'MemberShip Id ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.membershipId}'),
                  const TextSpan(text: 'DegignaitonId ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.designationId}'),
                  const TextSpan(text: 'Join Date ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${model.joinDate}'),
                  TextSpan(text: DateFormat('dd-MMM-yyyy').format(DateTime.now())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

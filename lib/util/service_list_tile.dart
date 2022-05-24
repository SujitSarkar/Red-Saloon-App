import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/product_model.dart';
import '../model/service_list-model.dart';
import '../variables/config.dart';
import '../widgets/decoration.dart';

class ServiceListTile extends StatelessWidget {
  const ServiceListTile({Key? key,required this.servicemodel}) : super(key: key);
  final SList servicemodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(dSize(.02)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(dSize(.02))),
      ),
      child: RichText(
        text: TextSpan(
          style: StDecoration.normalTextStyle,
          children: [
            const TextSpan(text: 'Price: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${servicemodel.price}\n'),
            const TextSpan(text: 'পার্টির নাম: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'tim'),
            const TextSpan(text: 'রঙের নাম: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  'tim'),
            const TextSpan(text: 'S/L নম্বর: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  'tim'),
            const TextSpan(text: 'G.G.S.M: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  'tim'),
            const TextSpan(text: 'কার্ড নাম্বার: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  'tim'),
            const TextSpan(text: 'রোল: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  'tim'),
            const TextSpan(text: 'ফ্যাব্রিক প্রাপ্তির তারিখ: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: DateFormat('dd-MMM-yyyy').format(servicemodel.updatedAt!)),
          ],
        ),
      ),
    );
  }
}

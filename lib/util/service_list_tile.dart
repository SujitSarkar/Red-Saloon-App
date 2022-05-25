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
            const TextSpan(text: 'Id: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${servicemodel.id}\n'),
            const TextSpan(text: 'Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${servicemodel.name}'),
            const TextSpan(text: 'Catagory Id ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${servicemodel.categoryId}'),
            const TextSpan(text: 'Price ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${servicemodel.price}'),
            const TextSpan(text: 'Descripiton ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${servicemodel.description}'),
            const TextSpan(text: 'Status', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${servicemodel.status}'),
            // const TextSpan(text: 'রোল: ', style: TextStyle(fontWeight: FontWeight.bold)),
            // TextSpan(text:  'tim'),
            // const TextSpan(text: 'ফ্যাব্রিক প্রাপ্তির তারিখ: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: DateFormat('dd-MMM-yyyy').format(servicemodel.updatedAt!)),
          ],
        ),
      ),
    );
  }
}

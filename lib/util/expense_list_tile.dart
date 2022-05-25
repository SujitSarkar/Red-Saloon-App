import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/expense_list_model.dart';
import '../model/product_model.dart';
import '../variables/config.dart';
import '../widgets/decoration.dart';

class ExpenceListTile extends StatelessWidget {
  const ExpenceListTile({Key? key,required this.elistModel}) : super(key: key);
  final Expense elistModel;

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
            TextSpan(text: '${elistModel.id}\n'),
            const TextSpan(text: 'Name ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${elistModel.name}'),
            const TextSpan(text: 'Amount ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${elistModel.amount}'),
            const TextSpan(text: 'Date', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${elistModel.date}'),
            const TextSpan(text: 'Reference', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${elistModel.reference}'),
            const TextSpan(text: 'Note ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${elistModel.note}'),
            const TextSpan(text: 'Expence Type ID', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${elistModel.expensetypeId}'),
            const TextSpan(text: 'Date', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: DateFormat('dd-MMM-yyyy').format(elistModel.updatedAt!)),
          ],
        ),
      ),
    );
  }
}

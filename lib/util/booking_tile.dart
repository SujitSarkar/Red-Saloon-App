import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/booking_list_model.dart';
import '../model/product_model.dart';
import '../variables/config.dart';
import '../widgets/decoration.dart';

class BookingListTile extends StatelessWidget {
  const BookingListTile({Key? key,required this.bModel}) : super(key: key);
  final BList bModel;

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
            const TextSpan(text: 'Id Number: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${bModel.id}\n'),
            const TextSpan(text: 'Customer Id: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${bModel.customerId}'),
            const TextSpan(text: 'Booking Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${bModel.bookingDate}'),
            const TextSpan(text: 'Booking Time: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${bModel.bookingTime}'),
            const TextSpan(text: 'Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${bModel.status}'),
            const TextSpan(text: 'Advance ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${bModel.advance}'),
            const TextSpan(text: 'Customer ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${bModel.customerId}'),
            const TextSpan(text: 'ফ্যাব্রিক প্রাপ্তির তারিখ: ', style: TextStyle(fontWeight: FontWeight.bold)),
            // TextSpan(text: DateFormat('dd-MMM-yyyy').format(bModel.updatedAt!)),
          ],
        ),
      ),
    );
  }
}

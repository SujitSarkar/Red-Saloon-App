import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/product_model.dart';
import '../variables/config.dart';
import '../widgets/decoration.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key,required this.model}) : super(key: key);
  final ProductData model;

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
            const TextSpan(text: 'Product Id: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${model.id}\n'),
            const TextSpan(text: 'Product Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '${model.name}'),
            const TextSpan(text: 'Price ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.price}'),
            const TextSpan(text: 'CatagoryId ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.categoryId}'),
            const TextSpan(text: 'Stauts ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.status}'),
            const TextSpan(text: 'CreateAt ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.createdAt}'),
            const TextSpan(text: 'Update ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.updatedAt}'),
            const TextSpan(text: 'Description ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.description}'),
            const TextSpan(text: 'Category ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  '${model.category}'),
            // TextSpan(text: DateFormat('dd-MMM-yyyy').format(model.updatedAt!)),
          ],
        ),
      ),
    );
  }
}

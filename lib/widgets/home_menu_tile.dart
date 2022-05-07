import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/public_controller.dart';
import '../model/home_menu_model.dart';
import '../variables/config.dart';


class HomeMenuTile extends StatelessWidget {
  const HomeMenuTile({Key? key, required this.model}) : super(key: key);
  final HomeMenuModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(
      builder: (pc) {
        return  InkWell(
            onTap: ()async{},
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(dSize(.04)),
              decoration: BoxDecoration(
                  color: model.color.withOpacity(.15),
                  borderRadius: BorderRadius.all(Radius.circular(dSize(.05)))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(model.icon,color: model.color,size: dSize(.12)),
                    backgroundColor: Colors.white,
                    radius: dSize(.09),
                  ),
                  SizedBox(height: dSize(.02)),
                  Text(model.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontSize: dSize(.045)
                          ,fontWeight: FontWeight.w600))
                ],
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(dSize(.05)))
        );
      }
    );
  }
}

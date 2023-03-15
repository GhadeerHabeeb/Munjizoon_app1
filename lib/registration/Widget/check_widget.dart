import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/controller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
final controller=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller){
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.Checkbox();

            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),

              ),
              child:controller.isCheck?
              Icon(Icons.check,size: 30,color:Get.isDarkMode?Colors.green:Colors.pink)
                  :Container(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              MyText(fontWeight: FontWeight.bold, fontSize: 16, text: 'I accept', color: Get.isDarkMode?Colors.black:Colors.white,)
            ],
          )
        ],
      );
    });
  }
}

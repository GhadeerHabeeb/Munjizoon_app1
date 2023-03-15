import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/MenuScreen/widget/List.dart';
import 'package:munjizoon_app/controller/controller.dart';
import 'package:rive/rive.dart';

//القائمة الجانبية
class MenuList extends StatefulWidget {
  final RiveAsset menu;
  final VoidCallback press;
   final ValueChanged<Artboard> riveonInit;

  final bool isActive;
   MenuList({required this.riveonInit, required this.menu,required this.press,required this.isActive,Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
 final controller=Get.put(AuthController());



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Divider(
          color: Colors.black12,
          thickness: 1,
        ),
        Stack(
          children: [

            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              height: 56,
                left: 0,
                width:widget.isActive?288:0,
                child:
            Container(
              decoration: BoxDecoration(
                color:Colors.amber.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(10)),

              ),
            )) ,
            ListTile(
            onTap:widget.press,
            leading:SizedBox(
            height: 34,
              width: 34,
            child:Icon(widget.menu.Icon,color: Colors.black,) ,
    ),
         /*CircleAvatar(
              backgroundColor: Colors.white30,
              child:

            ),*/
            title: Text(widget.menu.title,style: TextStyle(
                color: Colors.black
            ),),

          ),

          ]
        ),
      ],
    );
  }
}

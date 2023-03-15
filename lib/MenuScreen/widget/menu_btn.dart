import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MenuScreen/Side_menu.dart';
import 'package:rive/rive.dart';


class MenuBtn extends StatelessWidget {
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;

    MenuBtn({required this.isSideMenuClosed,required this.riveonInit,required this.press,Key? key}) : super(key: key);
final isSideMenuClosed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:press,
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child:
        IconButton(
            onPressed:press,
            icon: Icon(isSideMenuClosed?Icons.menu:Icons.close_rounded,size: 30,color: Colors.black,) ,)
      ),
    );
  }
}

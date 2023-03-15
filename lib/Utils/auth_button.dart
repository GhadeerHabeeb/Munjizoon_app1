import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/controller.dart';


class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  AuthButton({
    required this.text,
    required this.onPressed,

    Key? key}) : super(key: key);
  final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(12))
          ), duration:Duration(milliseconds: 200) ,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          top:controller.isActive?0 :-5,
          right:controller.isActive? 0:5,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 2),
              height: 50,
              width:MediaQuery.of(context).size.width-50,
              decoration: BoxDecoration(
                color: Colors.amber[500],
                borderRadius:  BorderRadius.all(Radius.circular(12)),

              ),
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                    primary:Get.isDarkMode?Colors.orange:Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding:EdgeInsets.symmetric(horizontal: 20,vertical: 12)
                ),
                onPressed:onPressed,
                child:MyText(text: text,fontSize:18 ,fontWeight: FontWeight.bold,color: Colors.white,) ,)


          ),

        )], );


  }
}

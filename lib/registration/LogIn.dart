import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/Utils/4.1%20my_string.dart';
import 'package:munjizoon_app/Utils/auth_button.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/controller.dart';
import 'package:munjizoon_app/registration/Widget/auth_text_from_fild.dart';
import 'package:munjizoon_app/routes/route.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>with SingleTickerProviderStateMixin {
  final formKey=GlobalKey<FormState>();
final TextEditingController passwordController=TextEditingController();
final TextEditingController phoneController=TextEditingController();
  final controller=Get.find<AuthController>();
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,
    value: 0.0,
    duration: Duration(
      seconds: 25
    ),
    upperBound: 1,
    lowerBound: -1,)..repeat();
  }
  @override
  Widget build(BuildContext context) {

    return   Scaffold(

          backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
          body:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(

              children: [
                AnimatedBuilder(
                    animation:_controller,
                    builder: (BuildContext context,child){
                      return   ClipPath(
                        clipper: CustomClipPath(_controller.value),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          decoration: BoxDecoration(
                            color:Colors.pinkAccent.withOpacity(.4),
                          ),

                        ),
                      );
                    }),
                AnimatedBuilder(
                    animation:_controller,
                    builder: (BuildContext context,child){
                      return   ClipPath(
                        clipper: CustomClipPath(_controller.value),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 210,
                          decoration: BoxDecoration(
                            color:Colors.orange.withOpacity(0.3),
                          ),

                        ),
                      );
                    }),
                AnimatedBuilder(
                    animation:_controller,
                    builder: (BuildContext context,child){
                      return   ClipPath(
                        clipper: CustomClipPath(_controller.value),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.amberAccent,Colors.yellowAccent]),

                          ),

                        ),
                      );
                    }), 
                Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 300,
                    child: Image.asset('assets/images/logo.png'),
                  ),

                      Padding(
                        padding: EdgeInsets.only(left: 25,right: 25),
                        child: Form(
                          key:formKey ,
                          child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'phone No.', color: Colors.black),
                                SizedBox(
                                  height: 20,
                                ),
                                AuthTextFromFild(
                                  isHover: false,
                                  controller: phoneController,
                                  obscureText: false,
                                  validation: (value){
                                    if(value.toString().length<=2||!RegExp(validationName).hasMatch(value)
                                    )
                                    {
                                      return 'enter valid name';
                                    }
                                    else
                                    {
                                      return null;
                                    }

                                  },
                                  prefixIcon:Icon(Icons.phone_android,color: Get.isDarkMode?Colors.pink:Colors.pink,) ,
                                  suffixIcon: Text(''),hintText: '+964- 0000000',),

                                SizedBox(
                                  height: 20,
                                ),
                                MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'Password.', color: Colors.black),
                                SizedBox(
                                  height: 20,
                                ),
                                GetBuilder<AuthController>(builder: (controller){
                                  return AuthTextFromFild(
                                    isHover: false,
                                    controller: passwordController,
                                    obscureText:controller.isVisibilty?true:false,
                                    validation: (value){
                                      if(value.toString().length<6)
                                      {
                                        return 'more than 6';
                                      }
                                      else
                                      {
                                        return null;
                                      }
                                    },
                                    prefixIcon:Icon(Icons.password,color: Get.isDarkMode?Colors.pink:Colors.pink,) ,
                                    suffixIcon: IconButton(onPressed:
                                        (){
                                      controller.visibilty();

                                    }, icon:controller.isVisibilty? Icon(Icons.visibility_off,color: Colors.black,):Icon(Icons.visibility,color: Colors.black,)),hintText: 'password',);

                                }),
                                SizedBox(
                                  height: 50,
                                ),

                                AuthButton(text: 'LogIn',onPressed: (){
                                  setState(() {
                                    controller.Active();
                                  });
                                  Get.toNamed(Routes.HomePage);
                                },),
                                SizedBox(
                                  height: 20,
                                ),



                              ],
                            ),


                          ),
                        ),





                ],

              ),

              ]
            ),
          )

    );

  }
}



class CustomClipPath extends CustomClipper<Path> {
  double move=0;
  CustomClipPath(this.move);
  double slice= pi;
  @override
  Path getClip(Size size) {

    Path path=Path();
    path.lineTo(0, size.height*0.8);
    double xCenter=size.width*0.5+(size.width*0.6)*sin(move*slice);
    double yCenter=size.height+30*cos(move*slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height*0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}







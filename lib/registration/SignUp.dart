import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/Utils/4.1%20my_string.dart';
import 'package:munjizoon_app/Utils/auth_button.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/controller.dart';

import 'package:munjizoon_app/registration/Widget/auth_text_from_fild.dart';
import 'package:munjizoon_app/registration/Widget/check_widget.dart';
import 'package:munjizoon_app/routes/route.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey=GlobalKey<FormState>();

  final TextEditingController nameController=TextEditingController();

  final TextEditingController emailController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final TextEditingController phoneController=TextEditingController();

  final controller=Get.find<AuthController>();
 bool isHover=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          /*FocusScope.of(context).unfocus();*/

        },
        child: Scaffold(

            backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
            body:
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: [
                     Padding(
                          padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                          child: Form(
                            key:formKey ,
                            child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyText(fontWeight:FontWeight.w500, fontSize: 28, text: 'registration', color:Get.isDarkMode?Colors.pink:Colors.black,),

                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'phone No.', color: Colors.black),
                                SizedBox(
                                  height: 20,
                                ),
                                AuthTextFromFild(
                                  isHover: isHover,
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
                                  prefixIcon: Icon(Icons.phone_android,color: Get.isDarkMode?Colors.orange:Colors.orange,),
                                  suffixIcon:phoneController.text.isNotEmpty?IconButton(icon:Icon(Icons.close_rounded,color: Get.isDarkMode?Colors.grey:Colors.grey), onPressed: () {phoneController.clear(); },):Text(''),
                                  hintText: '+964- 0000000',),

                                SizedBox(
                                  height: 20,
                                ),
                                MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'name', color: Colors.black),
                                SizedBox(
                                  height: 20,
                                ),
                                AuthTextFromFild
                                  ( isHover: false,
                                  controller: nameController,
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
                                  prefixIcon:Icon(Icons.person,color: Get.isDarkMode?Colors.orange:Colors.orange,) ,
                                  suffixIcon: IconButton(icon:Icon(Icons.close_rounded,color: Get.isDarkMode?Colors.grey:Colors.grey), onPressed: () {nameController.clear(); },),
                                  hintText: 'User Name',),
                                SizedBox(
                                  height: 20,
                                ),
                                MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'Address.', color: Colors.black),
                                SizedBox(
                                  height: 20,
                                ),
                                AuthTextFromFild(
                                  isHover: false,
                                  controller: emailController,
                                  obscureText: false,
                                  validation: (value){
                                    if(!RegExp(validationEmail).hasMatch(value)
                                    )
                                    {
                                      return 'enter valid email';
                                    }
                                    else
                                    {
                                      return null;
                                    }
                                  },
                                  prefixIcon:Icon(Icons.location_city_sharp,color: Get.isDarkMode?Colors.orange:Colors.orange,) ,
                                  suffixIcon: IconButton(icon:Icon(Icons.close_rounded,color: Get.isDarkMode?Colors.grey:Colors.grey), onPressed: () {emailController.clear(); },),hintText: 'Baghdad Almansour',),

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

                                AuthButton(text: 'SignUp',onPressed: (){
                                  setState(() {
                                    controller.Active();
                                  });
                                 Get.toNamed(Routes.loginScreen);
                                },),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                    child: MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'or use one of your social profiles', color: Colors.black)),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: (){},
                                        child: Text('google'),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(150, 35),
                                        primary:Get.isDarkMode?Colors.pink:Colors.blueAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(3)
                                        ),
                                        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 12)
                                    )),
                                    ElevatedButton(
                                        onPressed: (){},
                                        child: Text('Facebook'),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(150, 35),
                                            primary:Get.isDarkMode?Colors.pink:Color(0xFF01579B),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(3)
                                            ),
                                            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 12)
                                        )),

                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(

                                      onPressed: (){

                                      },
                                      child:Text('ForgetPassword?',style:TextStyle(fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,




                                      ),


                                      ),

                                    ),
                                    MyText(fontWeight: FontWeight.normal, fontSize: 18, text: 'Sign Up', color: Colors.pinkAccent)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],),
                            ),

              ),








                  ], ),

              ),
            )
        ),
      ),
    );
  }
}

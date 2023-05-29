import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/HomePage.dart';
import 'package:munjizoon_app/MainScreen/main_screen.dart';
import 'package:munjizoon_app/Phone_Num_screen/MyOTPCode.dart';
import 'package:munjizoon_app/Phone_Num_screen/PhoneNumberScreen.dart';
import 'package:munjizoon_app/bindings/Auth_bindeng.dart';
import 'package:munjizoon_app/bindings/Main_bindings.dart';
import 'package:munjizoon_app/registration/LogIn.dart';
import 'package:munjizoon_app/registration/SignUp.dart';



class Approute{

  //init route
  static const welcome=Routes.PhoneNumberAuth;
  //getPages

static final route=[
  //GetPage(name: Routes.welcomeScreen, page: ()=> WelcomeScreen()),
  GetPage(name: Routes.loginScreen, page: ()=> LogInScreen(),binding: AuthBindeng()),
  GetPage(name: Routes.signupScreen, page: ()=> SignUpScreen(),binding: AuthBindeng()),
 // GetPage(name: Routes.forgotPassword, page: ()=> ForgotPassword(),binding: AuthBindeng()),
  GetPage(name: Routes.mainScreen, page: ()=> MainScreen(),bindings: [AuthBindeng(),MainBindings()]),
  GetPage(name: Routes.HomePage, page: ()=> HomePage(),bindings: [AuthBindeng(),MainBindings()]),
  GetPage(name: Routes.PhoneNumberAuth, page: ()=> MyPhone(),bindings: [AuthBindeng(),MainBindings()]),
  GetPage(name: Routes.myOtp, page: ()=> MyVerify(),bindings: [AuthBindeng(),MainBindings()]),
  //GetPage(name: Routes.cardScreen, page: ()=> CardScreen(),bindings: [AuthBindeng(),ProductBindings()]),
 // GetPage(name: Routes.paymentScreen, page: ()=> PaymentScreen(),bindings: [AuthBindeng(),MainBindings(),ProductBindings()]),
];

}

class Routes{
 // static const welcomeScreen='/welcomeScreen';
  static const loginScreen='/loginScreen';
  static const signupScreen='/signupScreen';
  static const HomePage='/homePage';
  static const forgotPassword='/forgotPassword';
  static const mainScreen='/mainScreen';
  static const cardScreen='/cardScreen';
  static const paymentScreen='/paymentScreen';
  static const HoverTextFild='/HoverTextField';
  static const PhoneNumberAuth='/PhoneNumberAuthScreen';
  static const myOtp='/OTP';


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munjizoon_app/FavorateScreen/SavedLectures.dart';

import 'package:munjizoon_app/MainScreen/main_screen.dart';
import 'package:munjizoon_app/MainScreen/widget/StagesContainer.dart';
import 'package:munjizoon_app/registration/LogIn.dart';
import 'package:munjizoon_app/registration/SignUp.dart';
import 'package:munjizoon_app/routes/route.dart';
import 'package:rive/rive.dart';

import '../../HomePage.dart';

class RiveAsset{
 final String title;
 final Icon  ;

 late SMIBool? input;
 RiveAsset({  required this.Icon,required this.title,this.input });
 set setInput(SMIBool status){
   input=status;
 }
}

List<RiveAsset>menuList=[

  RiveAsset(Icon: CupertinoIcons.person, title: 'Personal Information' ),
  RiveAsset(Icon: Icons.notifications_active_outlined, title: 'Notifications' ),
  RiveAsset(Icon: Icons.network_cell, title: 'WishList' ),
  RiveAsset(Icon: Icons.favorite_border, title: 'Liked' ),


];
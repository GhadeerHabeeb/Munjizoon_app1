import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/Main_controller.dart';
import 'package:munjizoon_app/MainScreen/widget/StagesContainer.dart';
import 'package:munjizoon_app/MainScreen/widget/search_text_form.dart';
import 'package:munjizoon_app/MenuScreen/Side_menu.dart';
import 'package:munjizoon_app/MenuScreen/widget/RiveController.dart';
import 'package:munjizoon_app/MenuScreen/widget/menu_btn.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:rive/rive.dart';
//في هذه الصفحة تمثل المراحل ولكل مرحلة المواد الدراسية المناسبة
class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}
late SMIBool isSlideBarClosed;
bool isSideMenuClosed=true;
class _MainScreenState extends State<MainScreen>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;//animate the menu
  late Animation<double> animationScale;//animate the mainPage
  @override
  void initState() {
    double begin=1;
    double end=0;
    _animationController=AnimationController(vsync:this,
      duration: Duration(milliseconds: 200),)..addListener(() {
      setState(() {

      });



    });
    animation=Tween<double>(begin: begin,end: end).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));

    animationScale=Tween<double>(begin:0.8 ,end:1 ).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();

  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor:isSideMenuClosed?Colors.grey[200]: Colors.grey[100] ,
            body:Stack(
              children: [


                AnimatedPositioned(
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: MediaQuery.of(context).size.height,
                  left: isSideMenuClosed?-288:0,
                  duration:Duration(milliseconds: 200),

                  width: 288,

                  child:SideMenu() ,
                ),


                //الصفحة الرئيسية
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(isSideMenuClosed?0:animation.value-30*animation.value*pi/180),
                        child: Transform.translate(
                            offset: isSideMenuClosed? Offset(0, 0):Offset(animation.value*265,0),
                            child: Transform.scale(
                              scale:isSideMenuClosed?1:animationScale.value,
                                child: ClipRRect(
                                  borderRadius:isSideMenuClosed?BorderRadius.all(Radius.circular(animation.value*0)):BorderRadius.all(Radius.circular(animation.value*24)),
                                    child: MainHome()))),
                      ),
                Positioned(
                 right: 20,
                  top: 10,

                 //زر القائمة الجانبية
                  child: MenuBtn(
                    riveonInit: (artboard) {
                      StateMachineController controller=RiveUtils.getRiveController(artboard,stateMachineName:"State Machine");
                      isSlideBarClosed=controller.findSMI("isOpen") as SMIBool;
                      isSlideBarClosed.value=true;
                    },
                    press:(){


                      setState(() {

                        isSideMenuClosed=!isSideMenuClosed;
                        if(isSideMenuClosed)
                          {
                            _animationController.forward();

                          }
                            else{
                              _animationController.reverse();
                        }

                      });
                    }, isSideMenuClosed:isSideMenuClosed  ,

                  ),
                ),

  ]
    )
                  )
    );
  }
}


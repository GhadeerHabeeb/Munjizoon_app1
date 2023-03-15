import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/HomePage.dart';
import 'package:munjizoon_app/MenuScreen/widget/List.dart';
import 'package:munjizoon_app/MenuScreen/widget/MenuList.dart';
import 'package:munjizoon_app/MenuScreen/widget/RiveController.dart';
import 'package:munjizoon_app/controller/controller.dart';
import 'package:munjizoon_app/registration/LogIn.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
   SideMenu({Key? key}) : super(key: key);


  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final controller=Get.put(AuthController());
   RiveAsset selectedMenu =menuList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: 288,
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.only(topRight:Radius.circular(20))
        ),
       
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:30.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white30,
                    child: Icon(CupertinoIcons.person,color: Colors.black,),

                  ),
                  title: Text('Ahmed Ali',style: TextStyle(
                    color: Colors.black
                  ),),
                  subtitle:Text('youtube',style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
             Padding(
                 padding: EdgeInsets.only(left: 24,top: 22,bottom: 16),
               child:Text('browse'.toUpperCase(),style: TextStyle(color: Colors.black12.withOpacity(0.5),fontSize: 20),),
             ),
              ...menuList.map((menu)=>
                  MenuList(
                    menu:menu,
                    riveonInit: (artboard)
                    {
                      StateMachineController controller=RiveUtils.getRiveController(artboard,stateMachineName:"TIMER_Interactivity");
                      menu.input=controller.findSMI("active") as SMIBool;
                    },
                  press:(){

                      menu.input?.change(true);

                      Future.delayed(Duration(milliseconds: 1),(){
                        menu.input?.change(false);
                    });
                      setState(() {
                       selectedMenu=menu;

                      });



                  },
                  isActive:selectedMenu==menu,

                  )
              )
            ],
          ),

        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/Main_controller.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
//الصفحة الاولى بها الشريط السفلي الذي يمثل الصفحة الرئيسية والمفضلة والبحث من الممكن تتغير
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();


  @override
  Widget build(BuildContext context) {
    double displayWidth=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Obx(() {
          return Scaffold(
            ///animation bottomNavigationBar
            bottomNavigationBar: Container(

              height: displayWidth*.155,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0,10),
                )],

              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal:displayWidth*0.1),
                itemCount: controller.tabs.length,
                  itemBuilder:
              (content,index)=>Obx(() => InkWell(
                onTap: (){
                  controller.currentIndex.value=index;
                  HapticFeedback.lightImpact();
                },
                splashColor: Colors.transparent,
                highlightColor:Colors.transparent ,
                child: Stack(
                  children: [

                    AnimatedContainer(duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,

                      height: index==controller.currentIndex.value?displayWidth*.32:displayWidth*.18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index==controller.currentIndex.value?displayWidth*.12:0,
                        width: index==controller.currentIndex.value?displayWidth*.35:0,
                        decoration: BoxDecoration(
                            color: index==controller.currentIndex.value?Colors.amber.withOpacity(.3):Colors.transparent,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index==controller.currentIndex.value?displayWidth*.31:displayWidth*.18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [

                          Row(

                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index==controller.currentIndex.value?displayWidth*.13:0,
                              ),
                              AnimatedOpacity(
                                opacity: index==controller.currentIndex.value?1:0,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,

                                child: Text(index==controller.currentIndex.value?'${listOfStrings[index]}':'',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              AnimatedContainer(duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index==controller.currentIndex.value?displayWidth*.03:20,),

                              Icon(listOfIcons[index],
                                size: displayWidth*.077,
                                color:index==controller.currentIndex.value?Colors.amber:Colors.black26 ,)
                            ],
                          )
                        ],
                      ),

                    ),

                  ],
                ),
              ))
              ),
            ),


            /*bottomNavigationBar:  BottomNavigationBar(
              backgroundColor:Colors.white,
              currentIndex: controller.currentIndex.value,
              selectedLabelStyle: TextStyle(
                color: Get.isDarkMode ? Colors.pink : Colors.red,),
                selectedItemColor: Colors.red,
              *//*  currentIndex: controller.currentIndex.value,*//*
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home,
                      color: Get.isDarkMode ? Colors.pink : Colors.red,),
                    icon: Icon(Icons.home,
                      color: Get.isDarkMode ? Colors.grey : Colors.grey,),
                    label: 'Home'

                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.favorite,
                      color: Get.isDarkMode ? Colors.pink : Colors.red,),
                    icon: Icon(Icons.favorite,
                      color: Get.isDarkMode ?  Colors.grey : Colors.grey,),
                    label: 'Favorate'
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.videogame_asset,
                      color: Get.isDarkMode ? Colors.pink : Colors.red,),
                    icon: Icon(Icons.videogame_asset,
                      color: Get.isDarkMode ?  Colors.grey : Colors.grey,),
                    label: 'Game'

                ),


              ],
              onTap: (index) {
                controller.currentIndex.value=index;
                //عند الضغط على اي من عناصر الشريط الاسفل تتلون بلون الاحمر
              },
            ),
   */
          body: Center(
            child: controller.tabs[controller.currentIndex.value],
          )


          );
        }


        )

    );
  }
List<String>listOfStrings=[
  'Home',
  'Like',
  'Search',
];
  List<IconData>listOfIcons=[

    Icons.home,
    Icons.favorite,
    Icons.search,

  ];

}


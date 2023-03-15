import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/MainScreen/widget/search_text_form.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/controller.dart';
import 'package:munjizoon_app/controller/product_controller.dart';
import 'package:munjizoon_app/lessonScreen/widget/Favorate.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatefulWidget {


    LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final controller=Get.find<AuthController>();
  List<String>titles=['title1','title2','title3','title4','title5','title6'];

  @override
  Widget build(BuildContext context) {
    var myList=context.watch<Favorites>().controller.favoriteList.obs ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.0,vertical:10 ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300],
                  ),
                  child:  IconButton(
                        onPressed: (){
                          Get.back();

                    }, icon: Icon(Icons.arrow_back,size:30 ,) ), ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(fontWeight: FontWeight.normal, fontSize: 20, text: 'الدرس', color: Colors.black),
                        MyText(fontWeight: FontWeight.normal, fontSize: 18, text: 'المستوي', color: Colors.black),
                      ],
                    )
                  ],

              ),
              SizedBox(
                height: 20,
              ),


              SearchFormText(),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child:
                 ListView.separated(
                     itemBuilder: (BuildContext context,int index){
                       return buildCardLecture( myList.value,index,context);

                     },
                     separatorBuilder: (BuildContext context,int index,){
                       return
                       Divider(
                         height: 20,


                       );
                     },
                     itemCount:titles.length)

                ),

    ]
    )
    )
      )
    );

  }

  Widget buildCardLecture( list, int index,context)
  {
    final currentItems=titles[index];

    return  Obx(() => Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        color: Colors.white,
        child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft:Radius.circular(50) ),
                  color: Colors.grey[300],
                ),
                child:Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right:10,
                      child:  IconButton(
                          onPressed:(){


                            if(!list.contains(currentItems))
                            {
                              list.add(currentItems);

                            }
                            else
                            {
                              list
                                  .remove(currentItems);
                              print('hello$list');
                            }


                          } ,  icon: Icon(Icons.favorite,size: 40,color:list.contains(currentItems)? Colors.pinkAccent:Colors.black12)),
                    )  ,
                    Positioned(
                        top: 50,
                        right:100,
                        child:  Icon(Icons.image,size: 100,color: Colors.black12.withOpacity(0.4),))
                  ],
                ),
              ),
              Container(
                  width:MediaQuery.of(context).size.width  ,
                  height: 80,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(fontWeight: FontWeight.bold, fontSize: 20, text: currentItems, color: Colors.black),
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){


                                },
                                icon:Icon(
                                  CupertinoIcons.game_controller,
                                  color:Colors.black,
                                  size: 30,)
                            ),
                            IconButton(onPressed: (){}, icon:Icon( Icons.image,size: 30,)),
                            IconButton(onPressed: (){}, icon:Icon( Icons.slow_motion_video_outlined,size: 30,)),


                          ],
                        )
                      ],
                    ),
                  )
              ) ,

            ]
        )

    ));
  }
}






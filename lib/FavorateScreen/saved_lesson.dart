import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/product_controller.dart';
import 'package:munjizoon_app/lessonScreen/widget/Favorate.dart';
import 'package:provider/provider.dart';

class SavedLesson extends StatelessWidget {
 SavedLesson({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    var myList=context.watch<Favorites>().controller.favoriteList.obs ;
    return  SafeArea(
        child:Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
          child:   Column(
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


                      ],

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,

                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyText(fontWeight: FontWeight.bold, fontSize: 20, text: 'المستوى: الاول', color: Colors.blue),
                                Row(

                                  children: [
                                    IconButton(
                                       onPressed:(){

                                       },
                                        icon:Icon(Icons.favorite,size: 30,color:Colors.red,)),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    MyText(fontWeight: FontWeight.bold, fontSize: 18, text: 'عنوان الدرس: جمع الاعداد', color: Colors.green),

                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width:MediaQuery.of(context).size.width  ,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only( ),
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child:  IconButton(onPressed: (){}, icon:Icon( Icons.video_collection_outlined,size: 60,color: Colors.grey,)),
                      ),
                    ),

                  ]
              )

          ),
        ),
    );
  }
}

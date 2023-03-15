

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:munjizoon_app/FavorateScreen/saved_lesson.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/MainScreen/widget/search_text_form.dart';
import 'package:munjizoon_app/MenuScreen/widget/List.dart';
import 'package:munjizoon_app/Utils/text_utils.dart';
import 'package:munjizoon_app/controller/product_controller.dart';
import 'package:munjizoon_app/lessonScreen/LessonScreen.dart';
import 'package:munjizoon_app/lessonScreen/widget/Favorate.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class SavedLectures extends StatelessWidget {
  SavedLectures({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {

    var myList=context.watch<Favorites>().controller.favoriteList.obs;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        MyText(fontWeight: FontWeight.bold, fontSize: 30, text: 'Saved', color: Colors.black54),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),

                          ),
                          child:Icon(Icons.menu,size: 30,),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                    SizedBox(
                      height: 20,
                    ),

                    Expanded(
                      child :
                       Obx(() {
                         if(myList.value.isEmpty)
                           {
                             return   Column(
                               children: [
                                 Container(
                                   height:300,
                                     width:300,
                                     child: Center(child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_5zytltan.json' ))),
                                 Text("you don't have any saved lectures",style: TextStyle(
                                   fontSize: 22,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.amber
                                 ),),
                               ],
                             );
                           }
                         else {
                  return GridView.count(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing:20,
                      children: [
                        ...myList.value
                            .map((element) => LongPressDraggable(
                                data: element,
                                onDragStarted: () =>
                                    controller.changeDeleting(true),
                                onDraggableCanceled: (_, __) =>
                                    controller.changeDeleting(false),
                                onDragEnd: (_) =>
                                    controller.changeDeleting(false),
                                feedback: Opacity(
                                  opacity: 0.8,
                                  child: buildSaved(list: element, context),
                                ),
                                child: buildSaved(list: element, context)))
                            .toList(),
                      ]);
                }
              })

                    ),
                  ],
                ),
              ),
        floatingActionButton: DragTarget<String>(
          builder:
              (_,__,___){
            if(myList.value.isEmpty)
              {
                return Container(

                );
              }
            else {
              return Obx(
                () => new FloatingActionButton(
                  heroTag: 'hero',
                  backgroundColor:
                      controller.deleting.value ? Colors.red : Colors.blue,
                  onPressed: () {},
                  child: Icon(Icons.delete),
                ),
              );
            }
          },
          onAccept: (String item ){
            myList.value.remove(item);
           print('hello$myList');
            EasyLoading.showSuccess('Task has been deleted');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
          }



  buildSaved( context, {
    required final String list,

})
  {

    return   GestureDetector(
      onTap: (){
        Get.to(SavedLesson());
      },
      child: Stack(
        children:
            [
              Container(
                height: 200,
                width: 200,


               child:  Material(
               color: Colors.transparent,


                 child: Container(

                   decoration: BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey,
                         offset: Offset(5, 5),
                         blurRadius: 0.5
                       )
                     ]
                   ),

                   child: Column(
                     children: [
                       ListTile(


                         title: Text(list,style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,

                         ),
                         ),
                         subtitle:Text('level',style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.bold,

                         ) ,),
                         trailing:IconButton(
                             onPressed: (){

                             },
                             icon: Icon(Icons.favorite,size: 30,color:Colors.red,)) ,
                       ),

                     ],
                   ),
                 ),
               )

              ),



                ],
              )
    );

  }

}
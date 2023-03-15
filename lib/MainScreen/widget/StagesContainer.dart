import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/MainScreen/widget/LessonContainer.dart';
import 'package:munjizoon_app/MainScreen/widget/search_text_form.dart';
import 'package:munjizoon_app/controller/product_controller.dart';
import 'package:munjizoon_app/lessonScreen/LessonScreen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

//تمثل مجموع list التي تحتوي على اسم المادة والمستوى ومربع ملون
class MainHome extends StatefulWidget {
   MainHome({Key? key}) : super(key: key);
final controller=Get.put<ProductController>;
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  /// List of Tab Bar Item


  /// List of body icon

  int current = 0;

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0,top: 40,left: 20),
        child: Container(
            width: MediaQuery.of(context).size.width,

            margin: const EdgeInsets.all(5),
            child: Column(
              children: [   SizedBox(
                height: 40,
              ),

                SearchFormText(),
                SizedBox(
                  height: 40,
                ),
                /// CUSTOM TABBAR
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height:60,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(

                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 10.0,
                                        offset: Offset(0, 10)
                                    )
                                  ],
                                  color: current == index
                                      ?items[index].color
                                      : items[index].color[100],
                                  borderRadius: current == index
                                      ? BorderRadius.circular(10)
                                      : BorderRadius.circular(10),
                                  border: current == index
                                      ? Border.all(
                                      color:Colors.grey, width: 2)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    items[index].level,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: current == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                                visible: current == index,
                                child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),

                                ))
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 10,
                  height: 10,
                  color: items[current].color,
                ),
                SizedBox(
                  height:15,
                ),
                /// MAIN BODY
                LessonContainer(current: current),
              ],
            ),

          ),
        ),

    );

  }


}
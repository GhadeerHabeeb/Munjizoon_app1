import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/lessonScreen/LessonScreen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
class LessonContainer extends StatelessWidget {
  final int current;
    LessonContainer({required this.current,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(top: 20),
      width:MediaQuery.of(context).size.width  ,
      height: 250,


      child:
      SafeArea(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                InkWell(
                  onTap:(){

                    Get.to(LessonScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10.0,
                          offset: Offset(0, 10)
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),

                    width: 310,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,

                            child: Stack(
                                children: [
                                  CircularStepProgressIndicator(
                                    totalSteps: 100,
                                    currentStep: 74,
                                    stepSize: 10,
                                    selectedColor:items[current].color,
                                    unselectedColor: Colors.grey[200],
                                    padding: 0,
                                    width: 50,
                                    height: 50,
                                    selectedStepSize: 5,
                                    unselectedStepSize: 5,
                                    roundedCap: (_, __) => true,
                                  ),
                                  Positioned(
                                      right:10,
                                      top:15,
                                      child: Text('70%')),
                                ]
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Positioned(
                            left:60,
                            child: Text(
                              items[index].lesson,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.deepPurple),
                            ),
                          ),

                          Positioned(
                            top: 25,
                            left:60,
                            child: Text(
                              items[current].level,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 30,
            thickness: 0.1,
          );
        }, itemCount:items.length,

        ),

      ),
    );
  }
}

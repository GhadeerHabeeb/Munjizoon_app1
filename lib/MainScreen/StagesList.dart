import 'package:flutter/material.dart';

  class StageItems{
  final int Id;
  final String lesson;
 final List<content> title;
  final String img;

  final String  level;
  final color  ;

  StageItems({required this.img, required this.title,required this.lesson ,required this.Id,required this.color,required this.level });
}

class content{
  final int id;
  final String title;

  content({required this.id,required this.title});
}
List<StageItems> items = [
   StageItems(
       Id:0,
       color:Colors.amberAccent,
       title:[
         content(id: 0,
        title: 'علوم 3 '),
         content(id: 1,
             title: 'علوم 2 '),
         content(id: 2,
             title: 'علوم 1 ')],
       lesson: 'العلوم التفاعلية' ,
       level: 'المستوى الاول',
   img: 'assets/images/8.png'),
StageItems(Id:1,color:Colors.greenAccent,
    lesson: 'الرياضيات التفاعلية',
    title:[content(id: 0,
        title:  'طرح الاعداد'),
      content(id: 1,
          title:  ' جمع الاعداد'),
      content(id: 2,
          title: 'ضرب 2 ')],
   level: 'المستوى الثاني',
    img: 'assets/images/9.png'),
StageItems(Id:2,color:Colors.blueAccent,
    lesson: 'English التفاعلية ',
  title:[ content(id: 0,
      title:  'انكليزي الاعداد'),
    content(id: 1,
        title:  ' انكليزي الاعداد'),
    content(id: 2,
        title: ' english 2 ')],
    level: 'المستوى الثالث', img: 'assets/images/10.png',),



];





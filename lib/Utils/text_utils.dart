import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final color;
   MyText({required this.fontWeight,required this.fontSize,required this.text,required this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

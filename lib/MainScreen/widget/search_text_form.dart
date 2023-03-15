import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchFormText extends StatelessWidget {
    SearchFormText({Key? key}) : super(key: key);
    TextEditingController searchTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: (searchName){

      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      keyboardType: TextInputType.text,
      cursorColor: Get.isDarkMode?Colors.pink:Colors.green,
      decoration:InputDecoration(

        suffixIcon:searchTextController.text.isNotEmpty?
        IconButton(
            onPressed:(){
              /*searchTextController.ClearSearch();*/
            },
            icon:Icon(
              Icons.close_rounded,
              color: Colors.grey,)):null,
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: Icon(Icons.search,size: 30,color: Colors.black,),
        hintText: 'Search What are you looking for',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
     filled: true,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
          borderRadius: BorderRadius.circular(10),

        ),
       focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),

      ) ,
    );
  }
}

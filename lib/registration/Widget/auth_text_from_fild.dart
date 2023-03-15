import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFromFild extends StatefulWidget {
  final TextEditingController controller;
  final Function validation;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  bool isHover;
  AuthTextFromFild(
  {required this.hintText,
    required this.suffixIcon,
      required this.prefixIcon,
        required this.validation,
        required this.obscureText,
      required this.controller,
    required this.isHover,Key? key});

  @override
  State<AuthTextFromFild> createState() => _AuthTextFromFildState();

}

class _AuthTextFromFildState extends State<AuthTextFromFild> {


  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(12))
          ), duration:Duration(milliseconds: 200) ,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          top:widget.isHover?-5:0,
          right:widget.isHover?5:0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2),
            height: 50,
            width:MediaQuery.of(context).size.width-50,
            decoration: BoxDecoration(
              color:widget.isHover?Colors.amber[500]:Colors.grey[200],
              borderRadius:  BorderRadius.all(Radius.circular(12)),

            ),
            child: Focus(

    autofocus: true,
    onFocusChange: (value){
    if(value)
    {
    setState(() {
    widget.isHover=true;

    });
    }
    else
    {
    setState(() {
    widget.isHover=false;

    });
    }

    },
    child: TextFormField(

                controller: widget.controller,
                obscureText: widget.obscureText,
                cursorColor:Colors.black,


                validator:(value) =>widget.validation(value),
                decoration: InputDecoration(
                  fillColor:Colors.transparent,
                  prefixIcon:widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,

                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,

                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,

                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,

                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ) ,

              ),

            )


        ),

        )], );




  }
}

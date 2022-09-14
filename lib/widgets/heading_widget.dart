
import 'package:final_project_movies_app/constant.dart';
import 'package:final_project_movies_app/screens/see_more_screen.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  String title;
  Function press;
  Heading({super.key,required this.press,required this.title});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          title,
          style: Constant.textStyleHeading,
        ),
        IconButton(
            icon:  Icon(Icons.arrow_forward,color: Constant.kThirdColor,),
            onPressed: (){
              press();
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero)),
      ],
    );
  }
}

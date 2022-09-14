import 'dart:ui';

import 'package:final_project_movies_app/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Constant.kPrimaryColor,
              Constant.kFourthColor,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,

          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/tv.png',width:200,),
              const SizedBox(height: 20,),
              const Text('Let\'s Find our tonight Movie!', style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w100,),)
            ],
          ),
        ),
          ),
      ),
    );
  }
}

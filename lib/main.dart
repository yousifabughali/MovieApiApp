import 'package:final_project_movies_app/helper/shared_preferences.dart';
import 'package:final_project_movies_app/screens/home_screen.dart';
import 'package:final_project_movies_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/movies_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SpHelper.spHelper.initSp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider<MoviesProvider>(create: (context)=> MoviesProvider()),
    ],
    child:MaterialApp(
          home:  HomeScreen(),
        ),);
      }
  }

import 'package:flutter/material.dart';
import 'package:my_ui_library/animations/animation1.dart';
import 'package:my_ui_library/animations/animation_home.dart';
import 'package:my_ui_library/practice_and_work/myworks_home.dart';
import 'package:my_ui_library/screens/main_home_page.dart';
import 'package:get/get.dart';
import 'package:my_ui_library/screens/popular_food_detail.dart';
import 'package:my_ui_library/screens/recommended_detail.dart';

import 'main_home.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
      bodyColor: Colors.white70,
      displayColor: Colors.white70,
    );

    return MaterialApp(
      title: 'My Flutter Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        primarySwatch: Colors.indigo,
        textTheme: newTextTheme
      ),
      // home: MainHomePage(),ypy
      // home: PopularFoodDetail(),
      //home: RecommendedDetail(),
      //home: AnimationHomePage(),
      home: MainHome(),
    );
  }
}


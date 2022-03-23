import 'package:flutter/material.dart';
import 'package:my_ui_library/animations/animation1.dart';
import 'package:my_ui_library/animations/animation_home.dart';
import 'package:my_ui_library/screens/main_home_page.dart';
import 'package:get/get.dart';
import 'package:my_ui_library/screens/popular_food_detail.dart';
import 'package:my_ui_library/screens/recommended_detail.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    // Get.find<PopularProductController>().getpopularProductList();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MainHomePage(),ypy
      // home: PopularFoodDetail(),
      //home: RecommendedDetail(),
      home: AnimationHomePage(),
    );
  }
}
import 'package:get/get.dart';

class Dimensions{
  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;

  //screensize=844, pageheight=220 --> 844/220=3.8
  static double pageViewController = screenHeight/3.0;
  static double pageViewTextController = screenHeight/6.0;
  static double pageView=screenHeight/2.2;

}
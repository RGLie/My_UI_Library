import 'package:flutter/material.dart';
import 'package:my_ui_library/screens/home_page_body.dart';

import 'package:my_ui_library/widgets/big_text.dart';
import 'package:my_ui_library/widgets/small_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15, ),
              padding: EdgeInsets.only(left:20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children:  [
                      BigText(text: "KOREA", color: Colors.indigoAccent,),//resuable text
                      Row(
                        children: [
                          SmallText(text: "Busan"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigoAccent
                      ),
                      child: Icon(Icons.search, color: Colors.white, size:24), //default icon size is 24

                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: HomePageBody())),

        ],
      ),
    );
  }
}

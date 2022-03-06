import 'package:flutter/material.dart';
import 'package:my_ui_library/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text),
          SizedBox(height: 10,),
          Row(
              children: [
                Wrap(
                  children: List.generate(5, (index) => Icon(Icons.star, color: Colors.lightGreenAccent,)),
                ),
                SizedBox(width: 10,),
                SmallText(text: "5.0"),
                SizedBox(width: 15,),
                SmallText(text: "4832"),
                SizedBox(width: 8,),
                SmallText(text: "comments"),
              ]
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: Colors.redAccent),
              IconAndTextWidget(icon: Icons.location_on, text: "333km", iconColor: Colors.indigoAccent),
              IconAndTextWidget(icon: Icons.money, text: "12312S", iconColor: Colors.lightGreen),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_ui_library/animations/animation1.dart';

import 'package:my_ui_library/animations/animation2.dart';
import 'package:my_ui_library/animations/animation3.dart';
import 'package:my_ui_library/animations/animation8.dart';
import 'package:my_ui_library/animations/animation9.dart';

import 'animation4.dart';
import 'animation5.dart';
import 'animation6.dart';
import 'animation7.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key}) : super(key: key);

  @override
  _AnimationHomePageState createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> {
  List title=[
    '1. Animated Container',
    '2. ScaleTransition',
    '3. FadeTransition',
    '4. PositionedTransition',
    '5. Rotation',
    '6. AnimatedSwitcher',
    '7. AnimatedOpacity',
    '8. Animated Default Text Style',
    '9. animated_text_kit',

  ];

  List pages=[
    FirstAnimation(),
    Animation2(),
    Animation3(),
    Animation4(),
    Animation5(),
    Animation6(),
    Animation7(),
    Animation8(),
    Animation9(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Flutter"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView.builder(

      itemCount: title.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Center(child: Text(title[index])),
          onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[index] )),

        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_ui_library/animations/animation1.dart';
import 'package:my_ui_library/animations/animation2.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key}) : super(key: key);

  @override
  _AnimationHomePageState createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> {
  List title=[
    '1',
    '2',
    '3',
  ];

  List pages=[
    FirstAnimation(),
    Animation2(),
    Animation2(),
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

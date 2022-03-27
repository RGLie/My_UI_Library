import 'package:flutter/material.dart';
import 'package:my_ui_library/animations/animation_home.dart';
import 'package:my_ui_library/practice_and_work/myworks_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List title=[
    'Animation Widget',
    'My Works',
  ];

  List pages=[
    AnimationHomePage(),
    MyWork(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter Works and Library"),
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

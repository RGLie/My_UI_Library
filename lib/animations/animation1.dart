import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_ui_library/animations/animation1_1.dart';

class FirstAnimation extends StatefulWidget {
  const FirstAnimation({Key? key}) : super(key: key);

  @override
  _FirstAnimationState createState() => _FirstAnimationState();
}

class _FirstAnimationState extends State<FirstAnimation> {

  bool isAni=false;

  Size? size;

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
  print(size);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 1"),
        actions: [
          InkWell(child: Icon(Icons.menu),
          onTap: () {
            setState(() {
              isAni=!isAni;
            });
          },
          )
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Stack(
      children: [
        Column(
          children: [
            Center(
              child: Text("Animation Screen"),
            ),
            ElevatedButton(
              child: Text("Another Way"),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Animation1_1() )),
            )
          ],
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(seconds: 1),
          height: double.maxFinite,
          width: (size?.width ?? 0)/2,
          color: Colors.indigoAccent,
          transform: Matrix4.translationValues(isAni?((size?.width ?? 0)/2):(size?.width ?? 0), 0, 0),
        )
      ],
    );
  }
}

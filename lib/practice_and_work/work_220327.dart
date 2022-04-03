import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_ui_library/widgets/reflect_ball.dart';

class Work220327 extends StatefulWidget {
  const Work220327({Key? key}) : super(key: key);

  @override
  _Work220327State createState() => _Work220327State();
}

class _Work220327State extends State<Work220327> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ball Reflects"),
      ),
      body: const Center(
        child: ReflectBall(
          ballRad: 20,
          mapXsize: 300,
          mapYsize: 500,
          xPosition: 100,
          yPosition: 200,
          xSpeed: 4,
          ySpeed: 4,
        )
      ),

    );
  }

}

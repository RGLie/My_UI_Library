import 'package:flutter/material.dart';

class Animation1_1 extends StatefulWidget {
  const Animation1_1({Key? key}) : super(key: key);

  @override
  _Animation1_1State createState() => _Animation1_1State();
}

class _Animation1_1State extends State<Animation1_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        child: Container(
          width: 200,
          height: double.maxFinite,
          color: Colors.indigoAccent,
        ),
      ),
    );
  }
}

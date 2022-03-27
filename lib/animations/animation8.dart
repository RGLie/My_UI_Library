import 'package:flutter/material.dart';

class Animation8 extends StatefulWidget {
  const Animation8({Key? key}) : super(key: key);

  @override
  _Animation8State createState() => _Animation8State();
}

class _Animation8State extends State<Animation8> {
  Color aniColor = Colors.indigoAccent;
  double aniSize = 25;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 8"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: Duration(seconds: 2),
              child: Text("Animation Text"),
              style: TextStyle(color: aniColor, fontSize: aniSize),
            ),
            Padding(padding: EdgeInsets.all(10),),
            ElevatedButton(
              child: Text("Change Color"),
              onPressed: () {
                setState(() {
                  aniColor=aniColor==Colors.indigoAccent?Colors.redAccent:Colors.indigoAccent;
                });
              },
            ),
            Padding(padding: EdgeInsets.all(10),),
            ElevatedButton(
              child: Text("Change Size"),
              onPressed: () {
                setState(() {
                  aniSize=aniSize==25?15:25;
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}

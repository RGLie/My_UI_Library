import 'package:flutter/material.dart';

class Animation7 extends StatefulWidget {
  const Animation7({Key? key}) : super(key: key);

  @override
  _Animation7State createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> {
  double boxOpacity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        boxOpacity=0.1;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation7"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: boxOpacity,
              duration: Duration(seconds: 2),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.indigoAccent,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  boxOpacity=boxOpacity==0.1?1:0.1;
                });
              },
              child: Text("Change Opacity"),
            )
          ],
        ),
      ),
    );
  }
}

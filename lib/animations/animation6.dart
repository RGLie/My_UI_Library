import 'package:flutter/material.dart';

class Animation6 extends StatefulWidget {
  const Animation6({Key? key}) : super(key: key);

  @override
  _Animation6State createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> {
  dynamic mWidget = firstWidget();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animaiton 6"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 2),
              child: mWidget,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  mWidget = secondWidget();
                });
              },
              child: Text("Animation Button"),
            )
          ],
        ),
      ),
    );
  }
}

class firstWidget extends StatelessWidget {
  const firstWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.indigoAccent,
    );
  }
}


class secondWidget extends StatelessWidget {
  const secondWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.lightGreen,
    );
  }
}

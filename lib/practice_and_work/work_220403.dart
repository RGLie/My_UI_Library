import 'dart:math';

import 'package:flutter/material.dart';

class Work220403 extends StatefulWidget {
  const Work220403({Key? key}) : super(key: key);

  @override
  _Work220403State createState() => _Work220403State();
}

class _Work220403State extends State<Work220403> with SingleTickerProviderStateMixin {
  double xPos = 100;
  double yPos = 100;
  dynamic _balls;
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    _balls=_paint(
        xPosition: xPos,
        yPosition: yPos,
        ballRad: 20
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Drag and Drop"),
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragDown: (details) {
            setState(() {
              if (_balls.isBallRegion(details.localPosition.dx, details.localPosition.dy)) {
                isClick=true;
              }
            });
          },
          onHorizontalDragEnd: (details) {
            setState(() {
              isClick=false;
            });
          },
          onHorizontalDragUpdate: (details) {
            if(isClick){
              setState(() {
                xPos=details.localPosition.dx;
                yPos=details.localPosition.dy;
              });
            }
          },

          child: Container(
            width: 300,
            height: 300,
            color: Colors.lightBlueAccent,
            child: CustomPaint(
              painter: _balls,
            ),
          ),
        )
        )
      );
  }
}

class _paint extends CustomPainter {
  final xPosition;
  final yPosition;
  final ballRad;

  _paint({
    required this.xPosition,
    required this.yPosition,
    required this.ballRad,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    for(double i=0; i<ballRad-1; i++){
      path.addOval(Rect.fromCircle(
          center: Offset(
            xPosition,
            yPosition
          ),
          radius: i
      ));
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  bool isBallRegion(double checkX, double checkY){
    if((pow(xPosition-checkX, 2)+pow(yPosition-checkY, 2))<=pow(ballRad, 2)){
      return true;
    }
    return false;
  }

}

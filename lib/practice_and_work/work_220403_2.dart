import 'dart:math';

import 'package:flutter/material.dart';

class Work220403_2 extends StatefulWidget {
  const Work220403_2({Key? key}) : super(key: key);

  @override
  _Work220403_2State createState() => _Work220403_2State();
}

class _Work220403_2State extends State<Work220403_2> with SingleTickerProviderStateMixin{
  bool isClick = false;
  var ball = myBall.origin();
  late AnimationController _animationController;
  double baseTime = 0.002;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1)
    );
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed ){
        setState(() {
          if(!isClick){
            if(ball.yPos+ball.ballRad > 300){
              ball.mulYvel(-1);
            }

            

          }
        });
        _animationController.value=0;
        _animationController.forward();
      }
    });
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Drag and Drop"),
        ),
        body: Center(
            child: GestureDetector(
              onHorizontalDragDown: (details) {
                setState(() {
                  if (ball.isBallRegion(details.localPosition.dx, details.localPosition.dy)) {
                    isClick=true;
                    ball.stop();
                  }
                });
              },
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (isClick) {
                    isClick=false;
                  }
                });
              },
              onHorizontalDragUpdate: (details) {
                if(isClick){
                  setState(() {
                    ball.setPosition(details.localPosition.dx, details.localPosition.dy);
                    ball.updateDraw();
                  });
                }
              },

              child: Container(
                width: 300,
                height: 300,
                color: Colors.lightBlueAccent,
                child: CustomPaint(
                  painter: _paint(ballPath: ball.draw),
                ),
              ),
            )
        )
    );
  }
}

class _paint extends CustomPainter {
  final Path ballPath;

  _paint({
    required this.ballPath,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();
    path.addPath(ballPath, Offset.zero);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;



}


class myBall{
  late double xPos;
  late double yPos;
  late double xVel;
  late double yVel;
  late double ballRad;
  late Path draw;

  myBall.origin(){
    xPos=100;
    yPos=100;
    xVel=0;
    yVel=0;
    ballRad=20;
    draw=Path();
    for(double i=0; i<ballRad-1; i++){
      draw.addOval(Rect.fromCircle(
          center: Offset(
              xPos,
              yPos,
          ),
          radius: i
      ));
    }
  }

  void addXpos(double x){
    xPos+=x;
  }

  void subXpos(double x){
    xPos-=x;
  }

  void addYpos(double y){
    yPos+=y;
  }

  void subYpos(double y){
    yPos-=y;
  }

  void mulXvel(double v){
    xVel*=v;
  }

  void mulYvel(double v){
    yVel*=v;
  }

  void stop(){
    xVel=0;
    yVel=0;
  }

  void setPosition(double x, double y){
    xPos=x;
    yPos=y;
  }

  bool isBallRegion(double checkX, double checkY){
    if((pow(xPos-checkX, 2)+pow(yPos-checkY, 2))<=pow(ballRad, 2)){
      return true;
    }
    return false;
  }

  void updateDraw(){
    draw=Path();
    for(double i=0; i<ballRad-1; i++){
      draw.addOval(Rect.fromCircle(
          center: Offset(
            xPos,
            yPos,
          ),
          radius: i
      ));
    }
  }
}

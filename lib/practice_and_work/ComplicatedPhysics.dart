import 'dart:math';

import 'package:flutter/material.dart';

class ComplicatedPhysics extends StatefulWidget {
  const ComplicatedPhysics({Key? key}) : super(key: key);

  @override
  _ComplicatedPhysicsState createState() => _ComplicatedPhysicsState();
}

class _ComplicatedPhysicsState extends State<ComplicatedPhysics> with SingleTickerProviderStateMixin{
  bool isClick = false;
  bool collapse = false;
  var ball = myBall.origin();
  late AnimationController _animationController;
  double baseTime = 0.001;
  double accel = 40000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 16)
    );
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if(!isClick){
        setState(() {
          // if (ball.yPos + ball.ballRad > 300) {
          //   ball.mulYvel(-1);
          //   print("${ball.yVel}, ${ball.yPos}");
          //   //ball.outVel();
          // }

          if (!collapse&&(ball.yVel.abs() *_animationController.value* baseTime + ball.yPos + ball.ballRad > 300)) {
            ball.mulYvel(-0.9);
            ball.subYpos(0.5 * accel * pow(baseTime, 2) - ball.yVel * baseTime);
            ball.updateAnimation(_animationController.value);
            collapse = true;
            ball.outVel();
            return;
          }

          ball.addYvel(baseTime * accel);
          ball.subYpos(0.5 * accel * pow(baseTime, 2) - ball.yVel * baseTime);
          //ball.updateDraw();
          ball.updateAnimation(_animationController.value);
          collapse=false;
        });
      }
      if(status == AnimationStatus.completed ){

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
          title: Text("Bounce!!"),
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
                if (isClick) {
                  setState(() {
                    isClick = false;
                  });
                }
              },
              onHorizontalDragUpdate: (details) {
                if (isClick) {
                  setState(() {
                    ball.setPosition(details.localPosition.dx, details.localPosition.dy);
                    ball.updateDraw();
                  });
                }
              },

              child: Container(
                width: 300,
                height: 300,
                color: Colors.white70,
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
      ..color = Colors.brown
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
  double baseTime = 0.002;

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

  void addXvel(double x){
    xVel+=x;
  }

  void subXvel(double x){
    xVel-=x;
  }

  void addYvel(double y){
    yVel+=y;
  }

  void subYvel(double y){
    yVel-=y;
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

  void outVel(){
    if(yVel.abs()<500){
      yVel=0;
    }
    if(xVel.abs()<100){
      xVel=0;
    }
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

  void updateAnimation(double animationValue){
    draw=Path();
    for(double i=0; i<ballRad-1; i++){
      draw.addOval(Rect.fromCircle(
          center: Offset(
            xPos + animationValue*xVel*baseTime,
            yPos + animationValue*yVel*baseTime,
          ),
          radius: i
      ));
    }
  }
}

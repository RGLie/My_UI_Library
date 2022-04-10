import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Physics extends StatefulWidget {
  const Physics({Key? key}) : super(key: key);

  @override
  _PhysicsState createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> with SingleTickerProviderStateMixin{
  bool isClick = false;
  bool isClickAfter = true;
  double mapY = 300;
  double mapX = 300;
  double elasticConstant = 0.7;
  List objList = [];
  var ball = myBall(100, 100, 300, 0, 20, 1);
  var newball = myBall(200, 100, 0, 0, 20, 1);
  late AnimationController _animationController;
  double baseTime = 0.016;
  int milliBaseTime = 16;
  double accel = 1000;
  Timer? _timer;


  double timerMilllisecond = 0;

  @override
  void deactivate() {
    // TODO: implement deactivate
    _timer?.cancel();
    super.deactivate();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 16)
    );
    _animationController.repeat();
    objList.add(ball);
    objList.add(newball);
  }

  @override
  void dispose(){

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List iPos = [];
    List fPos = [];
    double xV = 0;
    double yV = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text("Bounce!!"),
        ),
        body: Center(
            child: GestureDetector(
              onHorizontalDragDown: (details) {
                for(var i =0; i<objList.length; i++){
                  setState(() {
                    if (objList[i].isBallRegion(details.localPosition.dx, details.localPosition.dy)) {
                      objList[i].isClick=true;
                      objList[i].stop();
                      iPos.add(details.localPosition.dx);
                      iPos.add(details.localPosition.dy);
                    }
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                for(var i =0; i<objList.length; i++){
                  if (objList[i].isClick) {
                    print(fPos);


                    _timer?.cancel();

                    setState(() {
                      objList[i].xVel=(fPos[fPos.length-2]-iPos[0])/timerMilllisecond;
                      objList[i].yVel=(fPos[fPos.length-1]-iPos[1])/timerMilllisecond;

                      objList[i].isClick = false;
                      objList[i].isClickAfter = true;


                      iPos=[];
                      fPos=[];
                      timerMilllisecond=0;
                    });
                  }
                }
              },
              onHorizontalDragUpdate: (details) {
                for(var i =0; i<objList.length; i++){
                  if (objList[i].isClick) {
                    setState(() {
                      objList[i].setPosition(details.localPosition.dx, details.localPosition.dy);
                      objList[i].updateDraw();
                      print(details.localPosition.dx);
                      fPos.add(details.localPosition.dx);
                      fPos.add(details.localPosition.dy);
                    });


                    _timer = Timer.periodic(Duration(milliseconds: milliBaseTime), (timer) {
                      setState(() {
                        timerMilllisecond++;
                      });
                    });
                  }
                }
              },

              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {

                    for(var i =0; i<objList.length; i++){

                      if (!objList[i].isClick) {

                        if (objList[i].yVel!=0 || objList[i].isClickAfter) {
                          objList[i].addYvel(baseTime * accel);
                          //objList[i].subYpos(0.5 * accel * pow(baseTime, 2) - objList[i].yVel * baseTime);
                          objList[i].addYpos( objList[i].yVel * baseTime);
                          objList[i].updateAnimation(_animationController.value);
                          objList[i].isClickAfter=false;
                          if ((objList[i].yVel* _animationController.value*baseTime + objList[i].yPos + objList[i].ballRad >= mapY)) {
                            objList[i].mulYvel(-elasticConstant);
                            //print("${newball.yVel}, ${newball.yPos}");
                            objList[i].outVel();
                          }
                        }

                        if (objList[i].yVel!=0) {

                          objList[i].addXpos( objList[i].xVel * baseTime);
                          if ((objList[i].xVel* _animationController.value*baseTime + objList[i].xPos - objList[i].ballRad <=0)||(objList[i].xVel* _animationController.value*baseTime + objList[i].xPos + objList[i].ballRad >= mapX)) {

                            objList[i].mulXvel(-elasticConstant);
                            //print("${newball.yVel}, ${newball.yPos}");
                            //objList[i].outVel();
                          }
                          objList[i].updateAnimation(_animationController.value);
                          print(ball.xVel);
                        }


                      }
                    }

                    checkCollapse(objList, baseTime);

                    return Container(
                      width: 300,
                      height: 300,
                      color: Colors.white70,
                      child: CustomPaint(
                        painter: _paint(pathList: [ball.draw, newball.draw]),
                      ),
                    );
                  }
              ),
            )
        )
    );
  }
}

void checkCollapse(List<dynamic> objList, double baseTime) {
  for(int i=0; i<objList.length; i++){
    for(int j=i+1; j<objList.length; j++){
      if(objList[i].objType=='ball' && objList[j].objType=='ball'){
        if(getDistance(objList[i], objList[j]) < (objList[i].ballRad + objList[j].ballRad)){
          print("collapse");
          print("1 I ${objList[i].xVel}, ${objList[i].yVel}, J ${objList[j].xVel}, ${objList[j].yVel}");
          objList[i].xVel = (
              (objList[i].elasticConstant+1)*objList[j].mass*objList[j].xVel +
                  objList[i].xVel * (objList[i].mass - objList[i].elasticConstant * objList[j].mass)
          )/
              (objList[i].mass + objList[j].mass);

          objList[j].xVel = (
              (objList[j].elasticConstant+1)*objList[i].mass*objList[i].xVel +
                  objList[j].xVel * (objList[j].mass - objList[i].elasticConstant * objList[i].mass)
          )/
              (objList[i].mass + objList[j].mass);

          objList[i].yVel = (
              (objList[i].elasticConstant+1)*objList[j].mass*objList[j].yVel +
                  objList[i].yVel * (objList[i].mass - objList[i].elasticConstant * objList[j].mass)
          )/
              (objList[i].mass + objList[j].mass);

          objList[j].yVel = (
              (objList[j].elasticConstant+1)*objList[i].mass*objList[i].yVel +
                  objList[j].yVel * (objList[j].mass - objList[i].elasticConstant * objList[i].mass)
          )/
              (objList[i].mass + objList[j].mass);


          print("2 I ${objList[i].xVel}, ${objList[i].yVel}, J ${objList[j].xVel}, ${objList[j].yVel}");

        }

      }
    }
  }

}


double getDistance(physicsObject obj1, physicsObject obj2){
  return sqrt(pow(obj1.xPos-obj2.xPos, 2) + pow(obj1.yPos-obj2.yPos, 2));
}


class _paint extends CustomPainter {
  final List pathList;

  _paint({
    required this.pathList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    for(var i=0; i<pathList.length; i++){
      path.addPath(pathList[i], Offset.zero);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}


class physicsObject{
  double xPos = 0;
  double yPos = 0;
  double xVel = 0;
  double yVel = 0;
  double mass = 1;
  double baseTime = 0.016;
  double elasticConstant = 0.8;
  bool isClick = false;
  bool isClickAfter = true;

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
    if(yVel.abs()<6.6){
      yVel=0;
    }
    if(xVel.abs()<6.6){
      xVel=0;
    }
  }

  void setPosition(double x, double y){
    xPos=x;
    yPos=y;
  }
}



class myBall extends physicsObject{
  late double ballRad;
  late Path draw;
  String objType = 'ball';

  myBall(double xp, double yp, double xv, double yv, double br, double m){
    super.xPos=xp;
    super.yPos = yp;
    super.xVel = xv;
    super.yVel = yv;
    super.mass = m;
    ballRad = br;
    draw=Path();
    for(double i=0; i<ballRad-1; i++){
      draw.addOval(Rect.fromCircle(
          center: Offset(
              super.xPos, super.yPos
          ),
          radius: i
      ));
    }
  }


  bool isBallRegion(double checkX, double checkY){
    if((pow(super.xPos-checkX, 2)+pow(super.yPos-checkY, 2))<=pow(ballRad, 2)){
      return true;
    }
    return false;
  }

  void updateDraw(){
    draw=Path();
    for(double i=0; i<ballRad-1; i++){
      draw.addOval(Rect.fromCircle(
          center: Offset(
            super.xPos,
            super.yPos,
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
            super.xPos + animationValue*xVel*baseTime,
            super.yPos + animationValue*yVel*baseTime,
          ),
          radius: i
      ));
    }
  }
}

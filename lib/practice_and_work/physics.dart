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
  List objList = [];
  var ball = myBall(100, 100, 300, 0, 20);
  var newball = myBall(200, 100, 0, 0, 30);
  late AnimationController _animationController;
  double baseTime = 0.016;
  double accel = 1000;

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
                    }
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                for(var i =0; i<objList.length; i++){
                  if (objList[i].isClick) {
                    setState(() {
                      objList[i].isClick = false;
                      objList[i].isClickAfter = true;
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
                          objList[i].subYpos(0.5 * accel * pow(baseTime, 2) - objList[i].yVel * baseTime);
                          objList[i].updateAnimation(_animationController.value);
                          objList[i].isClickAfter=false;
                          if ((objList[i].yVel>=0)&&(objList[i].yVel* _animationController.value*baseTime + objList[i].yPos + objList[i].ballRad >= mapY)) {
                            objList[i].mulYvel(-0.7);
                            //print("${newball.yVel}, ${newball.yPos}");
                            objList[i].outVel();
                          }
                        }

                        if (objList[i].yVel!=0) {
                          print(ball.xVel);
                          objList[i].addXpos( objList[i].xVel * baseTime);
                          if ((objList[i].xVel* _animationController.value*baseTime + objList[i].xPos - objList[i].ballRad <=0)||(objList[i].xVel* _animationController.value*baseTime + objList[i].xPos + objList[i].ballRad >= mapX)) {

                            objList[i].mulXvel(-0.8);
                            //print("${newball.yVel}, ${newball.yPos}");
                            //objList[i].outVel();
                            objList[i].updateAnimation(_animationController.value);
                          }
                        }

                        checkCollapse(objList);
                      }



                    }


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

bool checkCollapse(List<dynamic> objList) {
  for(int i=0; i<objList.length; i++){
    for(int j=i; j<objList.length; j++){
      if(objList[i].objType=='ball' && objList[j].objType=='ball'){
        
      }
    }
  }
  return true;

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


class myBall{
  late double xPos;
  late double yPos;
  late double xVel;
  late double yVel;
  late double ballRad;
  late Path draw;
  double baseTime = 0.016;
  bool isClick = false;
  bool isClickAfter = true;
  String objType = 'ball';

  myBall(double xp, double yp, double xv, double yv, double br){
    xPos=xp;
    yPos = yp;
    xVel = xv;
    yVel = yv;
    ballRad = br;
    draw=Path();
    for(double i=0; i<ballRad-1; i++){
      draw.addOval(Rect.fromCircle(
          center: Offset(
              xPos, yPos
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

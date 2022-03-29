import 'package:flutter/material.dart';
import 'package:my_ui_library/practice_and_work/global_var.dart';

class ReflectBall extends StatefulWidget {
  final double mapXsize;
  final double mapYsize;
  final double xPosition;
  final double yPosition;
  final int ballRad;
  final int xVector;
  final int yVector;
  final double xSpeed;
  final double ySpeed;

  const ReflectBall({Key? key,
    required this.mapXsize,
    required this.mapYsize,
    required this.xPosition,
    required this.yPosition,
    required this.ballRad,
    required this.xVector,
    required this.yVector,
    required this.xSpeed,
    required this.ySpeed
  }) : super(key: key);

  @override
  _ReflectBallState createState() => _ReflectBallState();
}

class _ReflectBallState extends State<ReflectBall> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 10)
    );
    _animationController.forward();

    _animationController.addStatusListener((status) {
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: widget.mapXsize,
          height: widget.mapYsize,
          color: Colors.lightGreen,
          child: CustomPaint(
            painter: _ball(
              animationValue: _animationController.value,
              xVector: widget.xVector,
              yVector: widget.yVector,
              xPosition: widget.xPosition,
              yPosition: widget.yPosition,
              ballRad: widget.ballRad,
              xSpeed: widget.xSpeed,
              ySpeed: widget.ySpeed
            ),
          ),
        );
      },
    );
  }
}

class _ball extends CustomPainter {
  final animationValue;
  final xPosition;
  final yPosition;
  final xVector;
  final yVector;
  final ballRad;
  final xSpeed;
  final ySpeed;

  _ball({
    required this.animationValue,
    required this.xPosition,
    required this.yPosition,
    required this.xVector,
    required this.yVector,
    required this.ballRad,
    required this.xSpeed,
    required this.ySpeed,

  });

  @override
  void paint(Canvas canvas, Size size) {
    double heightParameter = 30;
    double periodParameter = 0.5;

    Paint paint = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    for(double i=0; i<ballRad; i++){
      path.addOval(Rect.fromCircle(
        center: Offset(
          xPosition + animationValue*xSpeed*xVector,
          yPosition + animationValue*ySpeed*yVector,
        ),
        radius: i
      ));
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
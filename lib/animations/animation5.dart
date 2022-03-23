import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  const Animation5({Key? key}) : super(key: key);

  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double angles=0;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this
    );
    _animationController.repeat();
    super.initState();

    Timer.periodic(Duration(microseconds: 1), (timer) {
      if(this.mounted){
        setState(() {
          angles+=pi/1000;
        });
      }
    });
    //Future.delayed(Duration(seconds: 3), ()=>{ }); 몇초있다 이거 실행
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
    //_animation.dispose();

  }



  @override
  Widget build(BuildContext context) {
    Animation _animation = CurvedAnimation(
        curve: Curves.easeInOut,
        parent: _animationController
    ); //don't need in here

    return Scaffold(
      appBar: AppBar(
        title: Text("Animation5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: CurvedAnimation(
                  curve: Curves.easeInOut,
                  parent: _animationController
              ),
              //tween은 범위
              child: Container(
                color: Colors.indigoAccent,
                width: 200,
                height: 200,
                child: Center(child: Text("Rotation Transition")),
              ),
            ),
            Padding(padding: EdgeInsets.all(50),),
            Transform.rotate(
              angle: angles,
              child: Container(
                color: Colors.indigoAccent,
                width: 200,
                height: 200,
                child: Center(child: Text("Transition.rotate")),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

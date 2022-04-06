import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({Key? key}) : super(key: key);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    );
    _animationController.repeat();
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
        title: Text("Animation 2"),
      ),
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    Animation<double> _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    return Center(
      //size, rotation, position, rotation
      child: Column(
        children: [
          Container(
            width: 400,
            height: 100,
            color: Colors.redAccent,
          ),
          ScaleTransition(
            scale: _animation,
            alignment: Alignment.topRight,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.indigoAccent,
            ),
          ),
          Container(
            width: 400,
            height: 100,
            color: Colors.redAccent,
          ),
          SizeTransition(
            sizeFactor: _animation,
            //axis: Axis.horizontal,
            //axisAlignment: 0,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.indigoAccent,
              child: Text("fadfd"),
            ),
          ),
          Container(
            width: 400,
            height: 100,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}




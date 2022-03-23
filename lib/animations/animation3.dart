import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({Key? key}) : super(key: key);

  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );
    _animationController.repeat();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
    //_animation.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 3"),
      ),
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    Animation<double> _animation = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    return Center(
      //size, rotation, position, rotation
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.indigoAccent,
        ),
      ),
    );
  }
}




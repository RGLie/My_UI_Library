import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  const Animation4({Key? key}) : super(key: key);

  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> with SingleTickerProviderStateMixin {
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
    double height=MediaQuery.of(context).size.height;

    Animation<RelativeRect> _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 0, 0), //left right top bottom
      end: RelativeRect.fromLTRB(0, 0, 0,height-100)
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 4"),
      ),
      body: Center(
        child: Stack(
          children: [
            PositionedTransition(
              //only in stack child
              rect: _animation,
              child: Container(
                //width: 200,
                //height: 200,
                color: Colors.indigoAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

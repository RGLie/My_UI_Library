import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Animation9 extends StatefulWidget {
  const Animation9({Key? key}) : super(key: key);

  @override
  _Animation9State createState() => _Animation9State();
}

class _Animation9State extends State<Animation9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 9"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 20.0, height: 100.0),
              const Text(
                'Be',
                style: TextStyle(fontSize: 43.0),
              ),
              const SizedBox(width: 20.0, height: 100.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('OPTIMISTIC'),
                    RotateAnimatedText('DIFFERENT'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],
          ),

          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('do IT!'),
                  FadeAnimatedText('do it RIGHT!!'),
                  FadeAnimatedText('do it RIGHT NOW!!!'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),


          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Bobbers',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('It is not enough to do your best,'),
                  TyperAnimatedText('you must know what to do,'),
                  TyperAnimatedText('and then do your best'),
                  TyperAnimatedText('- W.Edwards Deming'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),

          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Discipline is the best tool'),
                  TypewriterAnimatedText('Design first, then code'),
                  TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                  TypewriterAnimatedText('Do not test bugs out, design them out'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),

          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 70.0,
                fontFamily: 'Canterbury',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText('Think'),
                  ScaleAnimatedText('Build'),
                  ScaleAnimatedText('Ship'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),


          SizedBox(
            width: 250.0,
            child: TextLiquidFill(
              text: 'LIQUIDY',
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Colors.redAccent,
              textStyle: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),

          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText('Flicker Frenzy'),
                  FlickerAnimatedText('Night Vibes On'),
                  FlickerAnimatedText("C'est La Vie !"),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),


          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Hello World'),
                WavyAnimatedText('Look at the waves'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          )

        ],
      ),
    );
  }
}

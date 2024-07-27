import 'dart:math';

import 'package:flutter/material.dart';

class MyTweenAnim extends StatefulWidget {
  const MyTweenAnim({super.key});

  @override
  State<MyTweenAnim> createState() => _MyTweenAnimState();
}

class _MyTweenAnimState extends State<MyTweenAnim> {
  Color endColor = Colors.blue;
  double endSize = 200;
  double endRotate = 2 * pi;
  double slideVal = 0;

  void btn() {
    setState(() {
      endSize = endSize == 200 ? 100 : 200;
      endRotate = endRotate == 2 * pi ? 0 : 2 * pi;
      // endColor = endColor == Colors.red ? Colors.blue : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: endRotate),
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                  ),
                );
              },
            ),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 50, end: endSize),
              builder: (context, value, child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.purple,
                );
              },
            ),
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 700),
              tween: ColorTween(begin: Colors.red, end: endColor),
              builder: (context, value, child) {
                return Container(
                  width: 100,
                  height: 100,
                  color: value,
                );
              },
            ),
            Slider(
              value: slideVal,
              onChanged: (value) {
                setState(() {
                  slideVal = value;
                  endColor = Color.lerp(Colors.red, Colors.blue, slideVal)!;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: btn,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

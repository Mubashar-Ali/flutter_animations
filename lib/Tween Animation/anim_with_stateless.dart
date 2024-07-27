import 'dart:math';

import 'package:flutter/material.dart';

// This animation is performed without use statefull widget

class TweenAnimStateless extends StatelessWidget {
  final colorTween = ColorTween(begin: Colors.red, end: Colors.blue);
  final rotateTween = Tween<double>(begin: 0, end: 2 * pi);
  final sizeTween = Tween<double>(begin: 50, end: 200);
  final scaleTween = Tween<double>(begin: 1, end: 5);
  final alignmentTween = AlignmentTween(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  );

  TweenAnimStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: colorTween,
              builder: (context, value, child) {
                return Container(
                  width: 100,
                  height: 100,
                  color: value,
                );
              },
            ),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: rotateTween,
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
              tween: sizeTween,
              builder: (context, value, child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.purple,
                );
              },
            ),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: alignmentTween,
              builder: (context, value, child) {
                return Align(
                  alignment: value,
                  child: TweenAnimationBuilder(
                    duration: const Duration(seconds: 2),
                    tween: scaleTween,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: const FlutterLogo(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

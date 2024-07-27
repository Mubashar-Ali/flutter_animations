import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  double _width = 100;
  double _height = 100;
  double _turn = 0;
  double _opacity = 1.0;
  bool isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: isMoved ? 200 : 0,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    color: Colors.red,
                    width: _width,
                    height: _height,
                  ),
                  AnimatedRotation(
                    turns: _turn,
                    duration: const Duration(seconds: 2),
                    child: const Icon(Icons.home, size: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: btn),
    );
  }

  void btn() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _turn = _turn == 3 ? 1 : 3;
      _opacity = _opacity == 1.0 ? 0.1 : 1.0;
      isMoved = !isMoved;
    });
  }
}

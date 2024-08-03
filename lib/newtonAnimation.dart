import 'dart:math';
import 'package:flutter/material.dart';

class NewtonAnimation extends StatefulWidget {
  const NewtonAnimation({super.key});

  @override
  State<NewtonAnimation> createState() => _NewtonAnimationState();
}

bool toggle = false;
late Animation<double> leftLine;
late Animation<double> rightLin;

class _NewtonAnimationState extends State<NewtonAnimation> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;
  late Animation<double> rightx;
  late Animation<double> righty;
  late Animation<double> leftx;
  late Animation<double> lefty;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..addListener(() => setState(() {
            if (_animationController.isDismissed) {
              _animationController2
                  .forward()
                  .then((value) => _animationController2.reverse());
              _animationController.stop();
            } else {
              _animationController2.stop();
            }
          }))
      ..forward().then((value) => _animationController.reverse());

    _animationController2 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(
        () => setState(() {
          if (_animationController2.isDismissed) {
            _animationController
                .forward()
                .then((value) => _animationController.reverse());
          } else {
            _animationController.stop();
          }
        }),
      );

    rightx = Tween<double>(begin: 0, end: 150).animate(_animationController);
    righty = Tween<double>(begin: 0, end: -30).animate(_animationController);
    leftx = Tween<double>(begin: 0, end: -150).animate(_animationController2);
    lefty = Tween<double>(begin: 0, end: -30).animate(_animationController2);
    leftLine =
        Tween<double>(begin: 300, end: 440).animate(_animationController);
    rightLin =
        Tween<double>(begin: 200, end: 60).animate(_animationController2);
  }

  void btn() {
    setState(() {
      _animationController.forward();
      if (_animationController.isCompleted) {
        _animationController2.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 500,
          height: 700,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 250, height: 20, color: Colors.black),
              SizedBox(
                width: double.infinity,
                height: 250,
                // color: Colors.black38,
                child: CustomPaint(painter: LinePainter()),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(leftx.value, lefty.value),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [.1, .4, .9],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(rightx.value, righty.value),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [.1, .4, .9],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    var h = size.height;
    var radius = min(w, h);

    var paint = Paint()
      ..color = Colors.black38
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // canvas.drawLine(Offset(radius * .8, 0), Offset(radius * .8, h), paint);
    // canvas.drawLine(Offset(radius * 1.2, 0), Offset(radius * 1.2, h), paint);
    canvas.drawLine(Offset(radius * 1.2, 0), Offset(leftLine.value, h), paint);
    canvas.drawLine(Offset(radius * .8, 0), Offset(rightLin.value, h), paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      })
      ..forward();

    rotateAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    scaleAnimation =
        Tween<double>(begin: 1, end: 3).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ScaleTransition(
      //   scale: scaleAnimation,
      //   child: RotationTransition(
      //     turns: rotateAnimation,
      //     child: Container(
      //       color: colorAnimation.value,
      //       width: 100,
      //       height: 100,
      //     ),
      //   ),
      // ),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return ScaleTransition(
            scale: scaleAnimation,
            child: RotationTransition(
              turns: rotateAnimation,
              child: Container(
                color: colorAnimation.value,
                width: 100,
                height: 100,
              ),
            ),
          );
        },
      ),
    );
  }
}

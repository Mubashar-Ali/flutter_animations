import 'package:flutter/material.dart';

class Clip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var Size(width: w, height: h) = size;
    Path path = Path()
      ..lineTo(0, h * .4)
      ..quadraticBezierTo(w * .8, h * .5, w, h)
      ..lineTo(w, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Clip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var Size(width: w, height: h) = size;
    Path path = Path()
      ..quadraticBezierTo(w * .8, h * .1, w, h * .65)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

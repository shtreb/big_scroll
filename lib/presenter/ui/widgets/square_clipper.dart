import 'package:flutter/material.dart';

class SquareClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    double _size = width > height ? height : width;
    double offsetHorizontal = width > height ? (width - height)/2 : 0;
    double offsetVertical = height > width ? (height - width)/2 : 0;

    Path path = Path();
    path.moveTo(offsetHorizontal, offsetVertical);
    path.lineTo(width - offsetHorizontal, offsetVertical);
    path.lineTo(width - offsetHorizontal, height - offsetVertical);
    path.lineTo(offsetHorizontal, height - offsetVertical);
    path.moveTo(offsetHorizontal, offsetVertical);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}
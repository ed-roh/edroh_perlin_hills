import 'package:flutter/material.dart';
import 'dart:math';
import './utils/perlinNoise1D.dart';

class PerlinHills extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var mountainPaint = Paint()
        ..color = Color(0xFFf6979d)
        ..style = PaintingStyle.fill;

    var hillPaint = Paint()
        ..color = Color(0xFF63045f)
        ..style = PaintingStyle.fill;

    var groundFillPaint = Paint()
        ..color = Color(0xFF0d014c)
        ..style = PaintingStyle.fill;

    var groundBorderPaint = Paint()
        ..color = Color(0xFF910b67)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;
    
    var sunPaint = Paint()
        ..color = Color(0xFFfffb89)
        ..style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

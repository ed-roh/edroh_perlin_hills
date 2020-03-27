import 'package:flutter/material.dart';
import './perlinHills.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art',
      home: Container(
        color: Colors.blue,
        child: CustomPaint(
          painter: PerlinHills(),
        ),
      ),
    );
  }
}

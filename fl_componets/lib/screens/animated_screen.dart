import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadius _borderRadius = BorderRadius.circular(20);

  void changeShape() {
    final ran = Random();
    _width = ran.nextInt(300).toDouble() + 70;
    _height = ran.nextInt(300).toDouble() + 70;
    _color =
        Color.fromRGBO(ran.nextInt(255), ran.nextInt(255), ran.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(ran.nextInt(300).toDouble() + 10);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_outline),
        onPressed: changeShape,
      ),
    );
  }
}

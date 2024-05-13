import 'package:flutter/material.dart';
import 'package:first_app/Gradient_container.dart';

void main() {
  runApp(
     const MaterialApp(
      home: Scaffold(
        body: GradientContainer([Color.fromARGB(255,255,255,255),Color.fromARGB(255, 21, 10, 233)]),
      ),
    ),
  );
}


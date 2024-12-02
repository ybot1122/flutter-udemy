import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 82, 41, 153),
            Color.fromARGB(255, 125, 71, 218)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}

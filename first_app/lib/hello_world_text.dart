import 'package:flutter/material.dart';

class HelloWorldText extends StatelessWidget {
  const HelloWorldText({super.key});

  @override
  Widget build(context) {
    return const Text(
      "Hello World Again.",
      style: TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}

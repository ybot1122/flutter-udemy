import 'package:flutter/material.dart';
import './hello_world_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.orangeAccent],
            begin: startAlignment,
            end: endAlignment),
      ),
      child: const Center(
        child: HelloWorldText('Hello World'),
      ),
    );
  }
}

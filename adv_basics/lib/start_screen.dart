import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset("assets/images/quiz-logo.png", width: 300),
        const Text(
          "Learn Flutter the Fun Way!",
          style: TextStyle(),
        )
      ]),
    );
  }
}

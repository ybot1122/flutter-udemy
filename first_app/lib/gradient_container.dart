import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

void rollDice() {}

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startColor, this.endColor, {super.key});

  final Color startColor;
  final Color endColor;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: startAlignment,
            end: endAlignment),
      ),
      child: Center(
        child: Column(children: [
          Image.asset(
            "assets/images/dice-2.png",
            width: 200,
          ),
          const TextButton(onPressed: rollDice, child: Text('Roll Dice')),
        ]),
      ),
    );
  }
}

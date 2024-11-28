import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer(this.startColor, this.endColor, {super.key});

  final Color startColor;
  final Color endColor;

  var diceImage = "assets/images/dice-2.png";

  void rollDice() {
    diceImage = "assets/images/dice-5.png";
    print("rolling dice");
  }

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
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            diceImage,
            width: 200,
          ),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28),
            ),
            child: const Text('Roll Dice'),
          ),
        ]),
      ),
    );
  }
}

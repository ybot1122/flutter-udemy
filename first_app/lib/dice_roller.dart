import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceImage = "assets/images/dice-2.png";

  void rollDice() {
    setState(() {
      diceImage = "assets/images/dice-5.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
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
    ]);
  }
}

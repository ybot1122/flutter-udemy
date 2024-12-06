import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.switchScreen, {
    required this.chosenAnswers,
    super.key,
  });

  final void Function() switchScreen;

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            const Text('List of answers and questions...'),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: switchScreen,
              child: const Text(
                'Start Over',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

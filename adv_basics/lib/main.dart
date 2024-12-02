import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
          ),
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "Learn Flutter the fun way!",
              style: TextStyle(color: Colors.white70, fontSize: 24),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Colors.blue,
            label: const Text("Start quiz"),
          )
        ],
      ),
      backgroundColor: Colors.purple,
    ),
  ));
}

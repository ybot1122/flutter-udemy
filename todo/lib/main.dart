import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

//import 'package:flutter_internals/ui_updates_demo.dart';

void main() {
  runApp(const App());
  var a = 1;
  final nums = [1, 2, a];
  nums.add(4);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Internals'),
          ),
          // body: const UIUpdatesDemo(),
          body: const Keys()),
    );
  }
}

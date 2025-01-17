import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class Shoppinglist extends StatelessWidget {
  Shoppinglist({super.key});

  final items = groceryItems;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            key: ValueKey(e.id),
            children: [
              Container(
                width: 25,
                height: 25,
                color: e.category.color,
              ),
              const SizedBox(width: 25),
              Text(e.name),
              const Spacer(),
              Text(e.quantity.toString()),
            ],
          ),
        );
      }).toList(),
    );
  }
}

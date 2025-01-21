import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class Shoppinglist extends StatelessWidget {
  Shoppinglist({super.key, required this.items});

  final items;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(items[index].name),
        leading: Container(
          width: 24,
          height: 24,
          color: items[index].category.color,
        ),
        trailing: Text(
          items[index].quantity.toString(),
        ),
      ),
    );
  }
}

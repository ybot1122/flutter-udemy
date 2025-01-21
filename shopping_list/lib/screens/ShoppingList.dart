import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';

class Shoppinglist extends StatelessWidget {
  Shoppinglist({super.key, required this.items, required this.deleteItem});

  final List<GroceryItem> items;
  final void Function(GroceryItem item) deleteItem;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('Need items'),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(color: Colors.red),
        key: Key(items[index].id),
        onDismissed: (direction) {
          deleteItem(items[index]);
        },
        child: ListTile(
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Name')),
              validator: (value) {
                return 'Demo...';
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Quantity'),
                    ),
                    initialValue: '1',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField(
                    items: [
                      for (final c in categories.entries)
                        DropdownMenuItem(
                          value: c.value,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: c.value.color,
                              ),
                              const SizedBox(width: 6),
                              Text(c.value.name),
                            ],
                          ),
                        ),
                    ],
                    onChanged: (value) {},
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/ShoppingList.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<GroceryItem> _groceryItems = [];
  String? _error;
  late Future<List<GroceryItem>> _loadedItems;

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        "flutter-prep-9de08-default-rtdb.firebaseio.com", 'shopping-list.json');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later');
    }

    if (response.body == "null") {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);

    final List<GroceryItem> _loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((t) => t.value.name == item.value['category'])
          .value;
      _loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }

    return _loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );

    setState(() {
      _loadedItems = _loadItems();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = FutureBuilder(
        future: _loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Shoppinglist(
            items: snapshot.requireData,
            deleteItem: (item) async {
              deleteAndUpdate() async {
                final url = Uri.https(
                    "flutter-prep-9de08-default-rtdb.firebaseio.com",
                    'shopping-list/${item.id}.json');

                final response = await http.delete(url, headers: {
                  'Content-Type': 'application/json',
                });
                if (response.statusCode >= 400) {
                  throw Exception("Failed to delete item");
                }

                return await _loadItems();
              }

              setState(() {
                _loadedItems = deleteAndUpdate();
              });
            },
          );
        });

    return Scaffold(
      body: content,
      appBar: AppBar(
        title: const Text(
          'Grocery List',
        ),
        actions: <Widget>[
          IconButton(onPressed: _addItem, icon: new Icon(Icons.plumbing)),
        ],
      ),
    );
  }
}

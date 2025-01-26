import 'package:favorite_places/model/Place.dart';
import 'package:favorite_places/providers/MyPlacesProvider.dart';
import 'package:favorite_places/screens/AddPlace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  void _addItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (buildContext) {
          return AddPlaceScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> myPlaces = ref.watch<List<Place>>(myPlacesProvider);

    Widget content = Center(
      child: Text(
        "Please add places",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );

    if (myPlaces.isNotEmpty) {
      content = ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: myPlaces.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                key: ValueKey(myPlaces[index].id),
                children: [
                  Text(
                    myPlaces[index].name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Place"),
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: content,
        ),
      ),
    );
  }
}

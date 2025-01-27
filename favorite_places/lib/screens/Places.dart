import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/MyPlacesProvider.dart';
import 'package:favorite_places/screens/AddPlace.dart';
import 'package:favorite_places/widgets/places_list.dart';
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

    Widget content = PlacesList(places: myPlaces);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
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

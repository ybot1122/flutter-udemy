import 'package:favorite_places/model/Place.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  final List<Place> myPlaces;

  const PlacesScreen({super.key, required this.myPlaces});

  @override
  Widget build(BuildContext context) {
    if (myPlaces.isEmpty) {
      return Center(
        child: Text(
          "Please add places",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: myPlaces.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              key: ValueKey(myPlaces[index].id),
              children: [
                Text(
                  myPlaces[index].name,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  myPlaces[index].id,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            );
          }),
    );
  }
}

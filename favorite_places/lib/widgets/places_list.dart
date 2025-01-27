import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "Please add places",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      );
    }

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              key: ValueKey(places[index].id),
              children: [
                Text(
                  places[index].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          );
        });
  }
}

import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlacesNotifier extends StateNotifier<List<Place>> {
  MyPlacesNotifier() : super(const []);

  bool togglePlace(Place p) {
    final exists = state.contains(p);

    if (exists) {
      state = state.where((m) => m.id != p.id).toList();
      return false;
    } else {
      state = [...state, p];
      return true;
    }
  }
}

final myPlacesProvider =
    StateNotifierProvider<MyPlacesNotifier, List<Place>>((ref) {
  return MyPlacesNotifier();
});

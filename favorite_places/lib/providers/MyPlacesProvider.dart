import 'package:favorite_places/model/Place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlacesNotifier extends StateNotifier<List<Place>> {
  MyPlacesNotifier() : super([]);

  bool togglePlace(Place p) {
    final exists = state.contains(p);

    print(state);
    if (exists) {
      state = state.where((m) => m.id != p.id).toList();
      return false;
    } else {
      print(p);
      state = [...state, p];
      print(state);
      return true;
    }
  }
}

final myPlacesProvider =
    StateNotifierProvider<MyPlacesNotifier, List<Place>>((ref) {
  return MyPlacesNotifier();
});

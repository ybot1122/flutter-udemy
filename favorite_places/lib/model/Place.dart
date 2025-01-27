import 'package:uuid/uuid.dart';

class Place {
  final String id;
  final String name;

  Place({required this.name}) : id = const Uuid().v4();
}

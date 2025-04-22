import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  String? description;
  bool isDone;
  DateTime createdAt;

  Todo({
    required this.title,
    this.description,
    this.isDone = false,
  })  : id = const Uuid().v4(),
        createdAt = DateTime.now();
}

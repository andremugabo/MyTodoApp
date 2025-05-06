import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final bool isDone;
  final DateTime createdAt;
  final DateTime? dueDate;
  final String? category;

  Todo({
    String? id,
    required this.title,
    this.description,
    this.isDone = false,
    DateTime? createdAt,
    this.dueDate,
    this.category,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    DateTime? createdAt,
    DateTime? dueDate,
    String? category,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void toggleTodo(String id) {
    state = state
        .map((todo) =>
            todo.id == id ? todo.copyWith(isDone: !todo.isDone) : todo)
        .toList();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void updateTodo(String id, Todo updatedTodo) {
    state = state.map((todo) => todo.id == id ? updatedTodo : todo).toList();
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

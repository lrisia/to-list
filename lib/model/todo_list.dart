import 'package:flutter_todo/model/todo.dart';

class TodoList {
  final List<Todo> _todos;

  TodoList({List<Todo>? todos}) : _todos = todos ?? [];

  List<Todo> get todos => _todos;
  int get length => _todos.length;

  void add(Todo todo) {
    _todos.add(todo);
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }
}

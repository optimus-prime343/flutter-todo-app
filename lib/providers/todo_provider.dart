import 'package:flutter/material.dart';

import '../data/dummy_todos.dart';
import '../models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = dummyTodos;

  List<Todo> get todos => _todos;

  String get totalCompletedTodos {
    List<Todo> completedTodos = _todos.where((todo) => todo.completed).toList();
    return '${completedTodos.length}';
  }

  String get totalTodos => '${_todos.length}';

  void addTodo(String title) {
    Todo newTodo = Todo(title: title);
    _todos = [newTodo, ..._todos];
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void updateTodo(String id, Todo updatedTodo) {
    List<Todo> updatedTodos =
        _todos.map((todo) => todo.id == id ? updatedTodo : todo).toList();
    _todos = updatedTodos;
    notifyListeners();
  }
}

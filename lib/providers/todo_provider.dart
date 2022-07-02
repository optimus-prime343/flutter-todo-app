import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dummy_todos.dart';
import '../models/todo_model.dart';

void saveTodos(List<Todo> todos) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('todos', json.encode(todos));
}

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = dummyTodos;

  List<Todo> get todos => _todos;

  String get totalCompletedTodos {
    List<Todo> completedTodos = _todos.where((todo) => todo.completed).toList();
    return '${completedTodos.length}';
  }

  String get totalTodos => '${_todos.length}';

  //load todos from device storage
  void loadTodos() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? loadedTodos = sharedPreferences.getString('todos');
    if (loadedTodos != null) {
      _todos = json.decode(loadedTodos);
      notifyListeners();
    }
  }

  void addTodo(String title) {
    Todo newTodo = Todo(title: title);
    _todos = [newTodo, ..._todos];
    saveTodos(_todos);
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    saveTodos(_todos);
    notifyListeners();
  }

  void updateTodo(String id, Todo updatedTodo) {
    List<Todo> updatedTodos =
        _todos.map((todo) => todo.id == id ? updatedTodo : todo).toList();
    _todos = updatedTodos;
    saveTodos(_todos);
    notifyListeners();
  }
}

import '../models/todo_model.dart';

List<Todo> dummyTodos = List.generate(
  10,
  (index) => Todo(title: 'This is todo $index'),
);

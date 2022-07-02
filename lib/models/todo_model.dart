import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo {
  final String id = uuid.v4();
  final String title;
  final bool completed;
  final DateTime createdAt = DateTime.now();

  Todo({
    required this.title,
    this.completed = false,
  });

  Todo copyWith({String? title, bool? completed}) {
    return Todo(
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

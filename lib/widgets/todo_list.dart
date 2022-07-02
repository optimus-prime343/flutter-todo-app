import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';
import '../models/todo_model.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  const TodoList({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final Todo todo = todos[index];
        return Consumer<TodoProvider>(
          builder: (context, value, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                todo.completed
                    ? CompletedIcon(
                        onTap: () => value.updateTodo(
                          todo.id,
                          todo.copyWith(completed: false),
                        ),
                      )
                    : IncompleteIcon(
                        onTap: () => value.updateTodo(
                          todo.id,
                          todo.copyWith(completed: true),
                        ),
                      ),
                const SizedBox(width: 25.0),
                Expanded(
                  child: Text(
                    todo.title,
                  ),
                ),
                IconButton(
                  iconSize: 30.0,
                  onPressed: () => value.deleteTodo(todo.id),
                  icon: const Icon(Icons.delete_outline),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class CompletedIcon extends StatelessWidget {
  final VoidCallback onTap;
  const CompletedIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class IncompleteIcon extends StatelessWidget {
  final VoidCallback onTap;
  const IncompleteIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}

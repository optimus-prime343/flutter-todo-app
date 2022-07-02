import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/add_todo_bottom_sheet.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_list.dart';
import '../widgets/todos_summary.dart';
import '../widgets/current_date.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CurrentDate(),
              const SizedBox(height: 20.0),
              const TodoSummary(),
              const SizedBox(height: 20.0),
              Consumer<TodoProvider>(
                builder: (context, value, children) => Expanded(
                  child: TodoList(todos: value.todos),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const AddTodoBottomSheet(),
                  );
                },
                child: const Text('Add Todo'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

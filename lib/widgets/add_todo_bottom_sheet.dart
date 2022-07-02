import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  String title = '';

  void handleAddTodo() {
    TodoProvider todoProvider = Provider.of<TodoProvider>(
      context,
      listen: false,
    );
    if (title.isEmpty || title.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title can"t be empty'),
        ),
      );
      return;
    }
    todoProvider.addTodo(title);
    // close the bottomsheet after adding a new todo
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 24.0,
          left: 24.0,
          right: 24.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => title = value),
              decoration: const InputDecoration(
                hintText: 'Enter todo title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: handleAddTodo,
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}

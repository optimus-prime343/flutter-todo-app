import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class TodoSummary extends StatelessWidget {
  const TodoSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SummaryText(
            label: 'Created Todos',
            value: value.totalTodos.toString(),
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          SummaryText(
            label: 'Completed Tasks',
            value: value.totalCompletedTodos,
            crossAxisAlignment: CrossAxisAlignment.end,
          )
        ],
      ),
    );
  }
}

class SummaryText extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  const SummaryText({
    Key? key,
    required this.label,
    required this.value,
    required this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

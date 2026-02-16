import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        onLongPress: () => longPressCallback(),
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) => checkboxCallback(value),
            ),
            IconButton(
              tooltip: 'Delete',
              icon: const Icon(Icons.delete_outline),
              color: colorScheme.error,
              onPressed: () => longPressCallback(),
            ),
          ],
        ),
      ),
    );
  }
}

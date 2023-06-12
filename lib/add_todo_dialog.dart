import "package:flutter/material.dart";
import "package:flutter_app/main.dart";
import "package:flutter_app/todolist.dart";
import "package:provider/provider.dart";

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoListProvider = Provider.of<TodoListProvider>(context);

    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: _textEditingController,
        decoration: const InputDecoration(hintText: 'Enter your Todo'),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              String task = _textEditingController.text;
              todoListProvider.addTodo(Todo(task: task));
              Navigator.of(context).pop();
            },
            child: const Text('Save'))
      ],
    );
  }
}

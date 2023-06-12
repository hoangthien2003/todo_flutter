import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class Todo {
  String task;
  bool isCompleted;

  Todo({Key? key, required this.task, this.isCompleted = false});
}

class TextTaskCompleted extends StatelessWidget {
  final String task;
  const TextTaskCompleted({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(task,
            style: const TextStyle(decoration: TextDecoration.lineThrough)));
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListProvider>(context).todoList;

    return Scaffold(
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            Todo todo = todoList[index];
            return ListTile(
              title: Text(todo.task,
                  style: todo.isCompleted
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey)
                      : const TextStyle(decoration: TextDecoration.none)),
              leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    setState(() {
                      todo.isCompleted = value!;
                    });
                  }),
            );
          }),
    );
  }
}

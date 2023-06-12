import 'package:flutter/material.dart';
import 'package:flutter_app/add_todo_dialog.dart';
import 'package:flutter_app/todolist.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('TodoApp'),
        ),
        backgroundColor: Colors.orange,
      ),
      body: const TodoListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showAddTodoDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddTodoDialog();
      });
}

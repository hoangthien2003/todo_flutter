import 'package:flutter/material.dart';
import 'package:flutter_app/todolist.dart';
import 'package:provider/provider.dart';
import "home.dart";

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoListProvider(),
    child: const MainApp(),
  ));
}

class TodoListProvider with ChangeNotifier {
  List<Todo> _todoList = [];

  List<Todo> get todoList => _todoList;

  void addTodo(Todo todo) {
    todoList.add(todo);
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeWidget());
  }
}

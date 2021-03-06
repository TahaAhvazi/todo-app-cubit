import 'package:flutter/material.dart';
import 'package:todo_app_cubit/widgets/create_todo.dart';
import 'package:todo_app_cubit/widgets/search_filter_todo.dart';
import 'package:todo_app_cubit/widgets/showTodos.dart';

import '../widgets/todoHeaderWidget.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TODO app'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: const [
                TodoHeader(),
                CreateTodo(),
                SizedBox(
                  height: 20.0,
                ),
                SearchAndFilterTodo(),
                ShowTodos()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app_cubit/cubits/filtred_todo_list/filtred_todo_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final todos = context.watch<FiltredTodoListCubit>().state.filtredTodos;
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: showBackgroundColor(0),
          secondaryBackground: showBackgroundColor(1),
          key: ValueKey(
            todos[index].id,
          ),
          child: Text(
            todos[index].description,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color.fromARGB(255, 255, 26, 26),
        );
      },
      itemCount: todos.length,
    );
  }

  Widget showBackgroundColor(int direction) {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      // ignore: prefer_const_constructors
      child: Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}

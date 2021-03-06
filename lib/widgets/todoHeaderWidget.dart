import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/cubits/cubits.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TODO",
          style: TextStyle(fontSize: 40.0),
        ),
        // BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
        //   builder: (context, state) {
        //     return Text(
        //       '${state.activeTodoCount}',
        //       style: const TextStyle(fontSize: 20, color: Colors.red),
        //     );
        //   },
        // )
        Text(
          '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
          style: const TextStyle(color: Colors.redAccent),
        ),
      ],
    );
  }
}

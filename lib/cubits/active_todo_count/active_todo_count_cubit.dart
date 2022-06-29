import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit/models/todo_model.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListStreamSubscription;
  final TodoListCubit todoListCubit;
  final int initialActiveTodoCount;
  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListStreamSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      // ignore: avoid_print
      print("ToDoListState : $todoListState");
      final int currentActiveTodos = todoListState.todos
          .where((Todo todo) => !todo.complete)
          .toList()
          .length;

      emit(
        state.copyWith(activeTodoCount: currentActiveTodos),
      );
    });
  }
  @override
  Future<void> close() {
    todoListStreamSubscription.cancel();
    // TODO: implement close
    return super.close();
  }
}

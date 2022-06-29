import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_cubit/models/todo_model.dart';

part 'filtred_todo_list_state.dart';

class FiltredTodoListCubit extends Cubit<FiltredTodoListState> {
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;

  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  FiltredTodoListCubit({
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FiltredTodoListState.initial()) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFiltredTodos();
    });

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFiltredTodos();
    });

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFiltredTodos();
    });
  }

  void setFiltredTodos() {
    List<Todo> _filtredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filtredTodos = todoListCubit.state.todos
            .where((Todo todo) => !todo.complete)
            .toList();
        break;
      case Filter.completed:
        _filtredTodos = todoListCubit.state.todos
            .where((Todo todo) => todo.complete)
            .toList();
        break;
      case Filter.all:
        _filtredTodos = todoListCubit.state.todos;
        break;
    }
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      _filtredTodos = _filtredTodos
          .where((Todo todo) => todo.description
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }
    emit(
      state.copyWith(filtredList: _filtredTodos),
    );
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoListSubscription.cancel();
    todoSearchSubscription.cancel();
    return super.close();
  }
}

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/models/todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.inital());

  // ignore: non_constant_identifier_names
  void ChangeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}

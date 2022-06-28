import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {
  TodoSearchCubit() : super(TodoSearchState.inital());

  void setSearchTerm(String newSreachTerm) {
    emit(
      state.copyWith(searchTerm: newSreachTerm),
    );
  }
}

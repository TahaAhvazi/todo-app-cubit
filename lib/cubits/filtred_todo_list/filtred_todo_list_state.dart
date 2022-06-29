// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtred_todo_list_cubit.dart';

class FiltredTodoListState extends Equatable {
  final List<Todo> filtredTodos;

  const FiltredTodoListState({required this.filtredTodos});

  factory FiltredTodoListState.initial() {
    return const FiltredTodoListState(
      filtredTodos: [],
    );
  }

  @override
  List<Object> get props => [filtredTodos];

  @override
  String toString() => 'FiltredTodoList($filtredTodos)';

  FiltredTodoListState copyWith({
    List<Todo>? filtredList,
  }) {
    return FiltredTodoListState(
      filtredTodos: filtredTodos ?? this.filtredTodos,
    );
  }
}

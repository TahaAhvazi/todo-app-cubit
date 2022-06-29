import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/models/todo_model.dart';
part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String newDescription) {
    final newtodo = Todo(description: newDescription);
    final newTodos = [...state.todos, newtodo];
    emit(
      state.copyWith(
        todos: newTodos,
      ),
    );
  }

  void editTodo(String id, String newDescription) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
            id: id, description: newDescription, complete: todo.complete);
      }
      return todo;
    }).toList();
    emit(
      state.copyWith(
        todos: newTodos,
      ),
    );
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          description: todo.description,
          complete: !todo.complete,
        );
      }
      return todo;
    }).toList();
    emit(
      state.copyWith(
        todos: newTodos,
      ),
    );
  }

  void removeTodo(Todo todo) {
    final newTodo = state.todos.where((Todo t) => t.id != todo.id).toList();
    emit(
      state.copyWith(todos: newTodo),
    );
  }
}

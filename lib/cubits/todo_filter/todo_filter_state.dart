part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;
  const TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.inital() {
    return const TodoFilterState(
      filter: Filter.all,
    );
  }

  @override
  List<Object> get props => [filter];

  @override
  String toString() {
    // TODO: implement toString
    return "TodoFilterStated (filter: $filter) ";
  }

  TodoFilterState copyWith({Filter? filter}) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

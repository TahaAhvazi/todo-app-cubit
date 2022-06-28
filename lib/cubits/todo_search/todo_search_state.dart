part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;
  const TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.inital() {
    return const TodoSearchState(
      searchTerm: "",
    );
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() {
    // TODO: implement toString
    return "SearchFilter(SEARCH TERM: $searchTerm)";
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

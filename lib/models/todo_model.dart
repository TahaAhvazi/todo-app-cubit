import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter {
  all,
  active,
  completed,
}

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String description;
  final bool complete;

  Todo({
    String? id,
    required this.description,
    this.complete = false,
  }) : this.id = id ?? uuid.v4();

  @override
  // TODO: implement props
  List<Object?> get props => [id, description, complete];

  @override
  String toString() {
    // TODO: implement toString
    return "Todo(ID : $id DESCRIPTION: $description COMMPLETE: $complete)";
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/cubits/cubits.dart';
import 'package:todo_app_cubit/models/todo_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search a TODO...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newdescription) {
            if (newdescription != null) {
              context.read<TodoSearchCubit>().setSearchTerm(newdescription);
            }
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return BlocBuilder<TodoFilterCubit, TodoFilterState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            BlocProvider.of<TodoFilterCubit>(context).ChangeFilter(filter);
          },
          child: Text(
            filter == Filter.all
                ? 'All'
                : filter == Filter.active
                    ? 'Active'
                    : 'Completed',
            style: TextStyle(
              fontSize: 18,
              color: textColor(context, filter),
            ),
          ),
        );
      },
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.read<TodoFilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}

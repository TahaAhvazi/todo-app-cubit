import 'package:flutter/material.dart';

import '../widgets/todoHeaderWidget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            TodoHeader(),
          ],
        ),
      ),
    );
  }
}

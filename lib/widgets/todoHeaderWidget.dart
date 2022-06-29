import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "TODO",
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          '0 Item found !',
          style: TextStyle(fontSize: 20, color: Colors.red),
        )
      ],
    );
  }
}

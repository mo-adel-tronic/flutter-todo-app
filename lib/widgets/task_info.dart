import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text.dart';

class TaskInfo extends StatelessWidget {
  final int done;
  final int due;
  const TaskInfo({super.key, this.done = 0, this.due = 0});

  @override
  Widget build (BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          smallText('due to: '),
          smallSpanText('$due')
        ],
      ),
      Row(
        children: [
          smallText('finished: '),
          smallSpanText('$done')
        ],
      )
    ],
  );
  }
}
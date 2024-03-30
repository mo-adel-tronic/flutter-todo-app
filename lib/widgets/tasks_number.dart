import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text.dart';

Widget todoTasksNumbers() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          smallText('due to: '),
          smallSpanText('4')
        ],
      ),
      Row(
        children: [
          smallText('finished: '),
          smallSpanText('2')
        ],
      )
    ],
  );
}
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/widgets/text.dart';

ListView todoItems() {
  return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, i) {
        return Column(
          children: [
            ListTile(
              title: smallText(
                'task 1',
                color: Colors.black54,
              ),
              trailing: const Checkbox(
                value: false,
                onChanged: null,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              height: 2,
              color: mainColor,
            )
          ],
        );
      });
}

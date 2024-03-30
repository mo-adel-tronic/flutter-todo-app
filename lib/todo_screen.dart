import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:todo_app/widgets/tasks.dart';
import 'package:todo_app/widgets/tasks_number.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: secColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Column(
          children: [
            todoAppBar(),
            todoTasksNumbers(),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: todoItems(),
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, 
          isScrollControlled: true,
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 15, right: 15),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Add Task', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: mainColor
                      ),),
                    ),
                    const TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20,),
                    TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: BeveledRectangleBorder()
                    ),
                    child: const Text('Add Task', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    )
                  ],
                ),
              ),
            );
          });
        },
        backgroundColor: secColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
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
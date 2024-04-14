import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/task_data.dart';
import 'package:todo_app/widgets/add_task.dart';
import 'package:todo_app/widgets/task_info.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/widgets/todo_appbar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks = [];
  void updateTasks () {
    setState(() {});
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, 
          isScrollControlled: true,
          builder: (context) {
            return AddTask(addNewTask: (newVal) {
              setState(() {
                tasks.add(Task(content: newVal));
              });
              Navigator.pop(context);
            },);
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
            const TodoAppBar(),
            TaskInfo(done: Task.countDone, due: Task.countDue,),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TaskList(tasks: tasks, updateTasks: updateTasks),
              )
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
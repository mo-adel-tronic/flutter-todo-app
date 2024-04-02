import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/widgets/add_task.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:todo_app/widgets/tasks_list.dart';
import 'package:todo_app/widgets/tasks_info.dart';
import 'package:todo_app/model/tasks.dart';

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
            return const AddTask();
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
            /***************
            Start Todo AppBar
            ***************/
            const TodoAppBar(),
            /***************
            Start Tasks Info
            ***************/
            TaskInfo(done: Provider.of<TaskData>(context).countDone, due: Provider.of<TaskData>(context).countDue,),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                /***************
                Start Tasks List
                ***************/
                child: const TaskLists(),
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
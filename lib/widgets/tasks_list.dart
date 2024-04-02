import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/widgets/text.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({super.key});
  @override
  Widget build (BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, i) {
          return SingleTask(task: taskData.tasks[i], changeTaskState: (task) {
            taskData.updateTask(task);
          },);
        });
      },
    );
  }
}

class SingleTask extends StatelessWidget {
  final SingleTaskData task;
  final Function changeTaskState;
  const SingleTask({super.key, required this.task, required this.changeTaskState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: smallText(
            task.content!,
            color: Colors.black54,
          ),
          titleTextStyle: TextStyle(
            decoration: task.isDone!? TextDecoration.lineThrough : null
          ),
          trailing: Checkbox(
            value: task.isDone,
            onChanged: (newVal) {
              changeTaskState(task);
            },
            fillColor: MaterialStateColor.resolveWith((states) {
              return states.contains(MaterialState.selected)? mainColor:Colors.transparent;
            }),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          height: 2,
          color: mainColor,
        )
      ],
    );
  }
}

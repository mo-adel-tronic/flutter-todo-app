import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/task_data.dart';
import 'package:todo_app/widgets/text.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function updateTasks;
  const TaskList({super.key, required this.tasks, required this.updateTasks});
  @override
  Widget build (BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, i) {
        return SingleTask(task: tasks[i], updateTasks: updateTasks);
      });
  }
}

class SingleTask extends StatefulWidget {
  final Task task;
  final Function updateTasks;
  const SingleTask({super.key, required this.task, required this.updateTasks});
  @override
  State<SingleTask> createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: smallText(
            widget.task.content!,
            color: Colors.black54,
          ),
          titleTextStyle: TextStyle(
            decoration: widget.task.isDone!? TextDecoration.lineThrough : null
          ),
          trailing: Checkbox(
            value: widget.task.isDone,
            onChanged: (newVal) {
              setState(() {
                widget.task.changeTaskState();
              });
              widget.updateTasks();
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
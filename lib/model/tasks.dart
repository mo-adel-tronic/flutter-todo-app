// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

mixin Task {
  static int countDone = 0;
  static int countDue = 0;
}

class SingleTaskData with Task {
  String? content;
  bool? isDone;
  SingleTaskData({required String content,bool isDone = false}) {
    this.content = content;
    this.isDone = isDone;
    if(isDone) {
      Task.countDone++;
    } else {
      Task.countDue++;
    }
  }

  void changeTaskState() {
    isDone = !isDone!;
    if(isDone!) {
      Task.countDone++;
      Task.countDue--;
    } else {
      Task.countDone--;
      Task.countDue++;
    }
  }
}
class TaskData extends ChangeNotifier with Task {
  List<SingleTaskData> tasks = [];
  int countDone = Task.countDone;
  int countDue = Task.countDue;

  void updateTask(SingleTaskData task) {
    task.changeTaskState();
    countDone = Task.countDone;
    countDue = Task.countDue;
    notifyListeners();
  }

  void addTask(String taskContent) {
    tasks.add(SingleTaskData(content: taskContent));
    countDue = Task.countDue;
    notifyListeners();
  }
}
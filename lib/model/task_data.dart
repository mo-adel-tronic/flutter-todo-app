// ignore_for_file: prefer_initializing_formals

class Task {
  String? content;
  bool? isDone = false;
  static int countDone = 0;
  static int countDue = 0;

  Task({required String content,bool isDone = false}) {
    this.content = content;
    this.isDone = isDone;
    if(isDone) {
      countDone++;
    } else {
      countDue++;
    }
  }

  void changeTaskState() {
    isDone = !isDone!;
    if(isDone!) {
      countDone++;
      countDue--;
    } else {
      countDone--;
      countDue++;
    }
  }

}
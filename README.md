# todo_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Branches

- main
- provider
- stateful
- training

## What you should have to do at stateful

- Create TodoScreen Widget
- Create List<Task> tasks inside TodoScreen

### TodoScreen

- Create floatingActionButton

``` dart
floatingActionButton: FloatingActionButton(
    onPressed: () {
        showModalBottomSheet(context: context, 
          isScrollControlled: true,
          builder: (context) {
            return AddTask();
          });
        },
    backgroundColor: secColor,
    foregroundColor: Colors.white,
    child: const Icon(Icons.add),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
```

- body

```dart
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
            TaskInfo(),
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
                child: TaskLists(),
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      )
```

### model/tasks

```dart
// ignore_for_file: prefer_initializing_formals

class Task {
  String? content;
  bool? isDone;
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
```
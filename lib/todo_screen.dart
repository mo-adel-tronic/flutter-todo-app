import 'package:firebase_auth/firebase_auth.dart';
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
      appBar: AppBar(title: const Text('todo app'),
      actions: [
        MaterialButton(onPressed: () async{
          try {
            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: 'm@gmail.com',
              password: '123456',
            );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }
        }, child: const Text('add new user'),)
      ],),
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
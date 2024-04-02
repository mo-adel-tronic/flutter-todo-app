import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/tasks.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build (BuildContext context) {
    String txtFieldData = '';
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
                  TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (String value) {
                      txtFieldData = value;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                  onPressed: () {
                    // because i want to rerender tasks and return it, so we will stop listen
                    Provider.of<TaskData>(context, listen: false).addTask(txtFieldData);
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: const BeveledRectangleBorder()
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
  }
}
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class AddTask extends StatelessWidget {
  final Function addNewTask;
  const AddTask({super.key, required this.addNewTask});
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
                    addNewTask(txtFieldData);
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
import 'package:flutter/material.dart';

Widget todoAppBar() {
  return const Padding(
    padding: EdgeInsets.only(top: 40, bottom: 80),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.playlist_add_check,
        color: Colors.white,
        size: 40,
        ),
        SizedBox(width: 20,),
        Text('ToDo App', 
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        )
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/todo_screen.dart';

void main() {
  // Handle State By Provider
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}

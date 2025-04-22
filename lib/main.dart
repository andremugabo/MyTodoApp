import 'package:flutter/material.dart';
import 'package:todoapp/screens/login_screen.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App ',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

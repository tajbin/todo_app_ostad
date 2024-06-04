import 'package:flutter/material.dart';
import 'package:todo_app_ostad/ui/screens/todo_list/todo_list_screens.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo APp',
      theme: _lightTheme(),
      home: const TodoListScreen(),
    );

  }

  ThemeData _lightTheme() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(vertical: 12)
        )
      )
    );
  }
}

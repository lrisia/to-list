import 'package:flutter/material.dart';
import 'package:flutter_todo/config/themes/theme_manager.dart';
import 'package:flutter_todo/screens/todo/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeManager themeManager = ThemeManager();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeManager.themeMode,
        home: const Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TodoScreen(),
        )));
  }
}

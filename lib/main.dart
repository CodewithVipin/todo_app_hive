import 'package:flutter/material.dart';
import 'package:todo_app_hive/pages/home_page.dart';
import 'package:todo_app_hive/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: AppThemes.darkTheme,
      home: HomePage(),
    );
  }
}

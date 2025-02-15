import 'package:flutter/material.dart';
import 'package:todo_app_hive/pages/home_page.dart';
import 'package:todo_app_hive/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true; // Default to dark mode

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: isDarkMode
          ? AppThemes.darkTheme
          : AppThemes.lightTheme, // Switch themes
      home: HomePage(toggleTheme: toggleTheme),
    );
  }
}

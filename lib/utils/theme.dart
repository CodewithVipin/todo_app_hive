import 'package:flutter/material.dart';

class AppThemes {
  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF121212), // Deep dark background
    primaryColor: Color(0xFFBB86FC), // Soft purple highlight
    hintColor: Color(0xFF03DAC5), // Teal accent
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1F1B24), // Dark AppBar
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardColor: Color(0xFF1E1E1E), // Dark card background
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFBB86FC),
      foregroundColor: Colors.black,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFFBB86FC), // Purple button color
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1E1E1E),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFBB86FC), width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white38),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFBB86FC),
      unselectedItemColor: Colors.white70,
    ),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light gray background
    primaryColor: Color(0xFF6200EA), // Deep purple primary color
    hintColor: Color(0xFF03A9F4), // Light blue accent
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF6200EA), // Purple AppBar
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardColor: Colors.white, // White card background
    textTheme: TextTheme(
      bodyLarge:
          TextStyle(color: Colors.black87, fontSize: 18), // Visible black text
      bodyMedium: TextStyle(color: Colors.black54), // Subtle gray text
      titleLarge: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}

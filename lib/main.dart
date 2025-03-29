import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF4CAF50), // Green
          secondary: Color(0xFF2196F3), // Blue
          surface: Colors.white,
          background: Color(0xFFFAFAFA),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.black12, width: 1),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black12),
          ),
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 10, 36, 83),
          fontSize: 22,
        )),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),
      darkTheme: ThemeData.dark(),
    ),
  );
}

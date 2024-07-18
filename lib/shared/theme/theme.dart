import 'package:flutter/material.dart';

class defaultTheme {
  getTheme({required BottomNavigationBarThemeData bottomNavigationBarTheme}) {
    return ThemeData(
        primarySwatch: Colors.blueGrey,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey, selectedItemColor: Colors.black));
  }
}

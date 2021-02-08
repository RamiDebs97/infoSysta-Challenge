import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.teal;
  static Color darkPrimary = Colors.teal;

  static Color lightAccent = Colors.white70;
  static Color darkAccent = Colors.black12;

  static Color lightBG = Colors.white;
  static Color darkBG = Colors.black45;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    appBarTheme: AppBarTheme(
      elevation: 5.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 5.0,
    ),
  );
}
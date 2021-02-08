import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Color(0xff154c79);
  static Color darkPrimary = Color(0xff154c79);

  static Color lightAccent = Colors.black12;
  static Color darkAccent = Colors.white70;

  static Color lightBG = Colors.white;
  static Color darkBG = Colors.black45;

  static Color lightPlaceHolder = Colors.black;
  static Color darkPlaceHolder = Colors.white;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: lightBG,
    hintColor: lightPlaceHolder,
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
    hintColor: darkPlaceHolder,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 5.0,
    ),
  );
}

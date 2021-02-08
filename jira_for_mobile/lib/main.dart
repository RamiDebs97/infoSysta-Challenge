import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Login/LoginScreen.dart';
import 'package:jira_for_mobile/Util/Constants.dart';
import 'package:jira_for_mobile/theme/theme_config.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: themeData(ThemeConfig.lightTheme),
      darkTheme: themeData(ThemeConfig.darkTheme),
      home: LoginScreen(),
    );
  }
}

ThemeData themeData(ThemeData theme) {
  return theme.copyWith();
}

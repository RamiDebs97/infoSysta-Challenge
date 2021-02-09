import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Home/HomeProvider.dart';
import 'package:jira_for_mobile/Home/HomeScreen.dart';
import 'package:jira_for_mobile/Login/LoginProvider.dart';
import 'package:jira_for_mobile/SplashScreen.dart';
import 'package:jira_for_mobile/Util/Constants.dart';
import 'package:jira_for_mobile/theme/theme_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: themeData(ThemeConfig.lightTheme),
      darkTheme: themeData(ThemeConfig.darkTheme),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/home_screen": (BuildContext context) => HomeScreen(),
      },
    );
  }
}

ThemeData themeData(ThemeData theme) {
  return theme.copyWith();
}

import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Home/HomeProvider.dart';
import 'package:jira_for_mobile/Home/HomeScreen.dart';
import 'package:jira_for_mobile/Login/LoginProvider.dart';
import 'package:jira_for_mobile/Login/LoginScreen.dart';
import 'package:jira_for_mobile/Memory/SharedPreferenceWrapper.dart';
import 'package:jira_for_mobile/Models/User.dart';
import 'package:jira_for_mobile/Util/Constants.dart';
import 'package:jira_for_mobile/theme/theme_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool loading;
  User user;

  @override
  void initState() {
    loading = true;
    loadData();
  }

  loadData() async {
    user = await SharedPreferenceWrapper.getUserData().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: themeData(ThemeConfig.lightTheme),
      darkTheme: themeData(ThemeConfig.darkTheme),
      home: loading
          ? Container()
          : user != null
              ? user.isLoggedIn
                  ? HomeScreen()
                  : LoginScreen()
              : LoginScreen(),
      routes: <String, WidgetBuilder>{
        "/home_screen": (BuildContext context) => HomeScreen(),
      },
    );
  }
}

ThemeData themeData(ThemeData theme) {
  return theme.copyWith();
}

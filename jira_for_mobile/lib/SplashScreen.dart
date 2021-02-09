import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Home/HomeScreen.dart';
import 'package:jira_for_mobile/Login/LoginScreen.dart';
import 'package:jira_for_mobile/Memory/SharedPreferenceWrapper.dart';
import 'package:jira_for_mobile/Models/User.dart';
import 'package:jira_for_mobile/Util/Constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  User user;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        loadData();
      }
    });
  }

  loadData() async {
    await SharedPreferenceWrapper.getUserData().then((value) {
      debugPrint(value.isLoggedIn.toString());
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) =>
              value.isLoggedIn ? HomeScreen() : LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).backgroundColor,
          child: Center(
              child: Lottie.asset(
            Constants.jiraAnimationPath,
            height: 300,
            width: 300,
            controller: _controller,
            repeat: false,
          )),
        ));
  }
}

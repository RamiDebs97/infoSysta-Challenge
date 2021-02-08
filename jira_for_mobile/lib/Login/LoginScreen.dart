import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Core%20Component/buttons/submit_button.dart';
import 'package:jira_for_mobile/Core%20Component/main/app_scaffold.dart';
import 'package:jira_for_mobile/Core%20Component/text/AppText.dart';
import 'package:jira_for_mobile/Core%20Component/text_fileds/app_form_field.dart';
import 'package:jira_for_mobile/Util/Constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.all(32),
      scaffoldKey: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Hero(
                  tag: "login_logo_hero",
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 4),
                        child: Image.asset(
                          Constants.logoPath,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppFormField(
                prefixIcon: Icon(Icons.link),
                onChanged: (text) {
                  // controller.email = text.trim();
                },
                hint: 'Project URL',
                label: 'Project URL',
                // validator: controller.validateEmail,
              ),
              AppFormField(
                prefixIcon: Icon(Icons.email),
                onChanged: (text) {
                  // controller.email = text.trim();
                },
                hint: 'Your Email',
                label: 'Email',
                // validator: controller.validateEmail,
              ),
              AppFormField(
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline_sharp),
                onChanged: (text) {
                  //controller.password = text;
                },
                hint: 'Your Token',
                label: 'Token',
                //validator: controller.validatePassword,
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: AppLabelText(
                      label: "Generate Token",
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: SubmitButton(
                  elevation: 5,
                  color: Theme.of(context).primaryColor,
                  label: 'login',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                  //loading: controller.loading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

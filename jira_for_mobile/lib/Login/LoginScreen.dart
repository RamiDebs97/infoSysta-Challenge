import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jira_for_mobile/Core%20Component/buttons/submit_button.dart';
import 'package:jira_for_mobile/Core%20Component/main/app_scaffold.dart';
import 'package:jira_for_mobile/Core%20Component/text/AppText.dart';
import 'package:jira_for_mobile/Core%20Component/text_fileds/app_form_field.dart';
import 'package:jira_for_mobile/Login/LoginProvider.dart';
import 'package:jira_for_mobile/Models/Issue.dart';
import 'package:jira_for_mobile/Util/Constants.dart';
import 'package:jira_for_mobile/Util/Functions.dart';
import 'package:jira_for_mobile/Util/app_dialog.dart';
import 'package:provider/provider.dart';

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
    SchedulerBinding.instance.addPostFrameCallback(
        (_) => Provider.of<LoginProvider>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder:
        (BuildContext context, LoginProvider controller, Widget child) {
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
                  onChanged: (url) {
                    controller.setUrl(url);
                  },
                  autoValidate: true,
                  validator: controller.validateUrl,
                  hint: 'Project URL',
                  label: 'Project URL',
                ),
                AppFormField(
                  prefixIcon: Icon(Icons.email),
                  onChanged: (email) {
                    controller.setEmail(email.trim());
                  },
                  autoValidate: true,
                  validator: controller.validateEmail,
                  hint: 'Your Email',
                  label: 'Email',
                ),
                AppFormField(
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  onChanged: (token) {
                    controller.setToken(token);
                  },
                  autoValidate: true,
                  validator: controller.validateToken,
                  hint: 'Your Token',
                  label: 'Token',
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
                    loading: controller.loading ? true : false,
                    color: Theme.of(context).primaryColor,
                    label: 'login',
                    onPressed: () => loginButtonClicked(controller),
                    //loading: controller.loading,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void loginButtonClicked(LoginProvider controller) async {
    if (_formKey.currentState.validate()) {
      controller.setLoading(true);
      List<Issue> listOfTasks =
          await controller.getListOfTasks().catchError((onError) {
        showDialog(
            context: context,
            builder: (ctx) {
              return AppDialog(
                message: Functions.checkApiError(onError),
              );
            });
        controller.setLoading(false);
      });
      if (listOfTasks != null) {
        if (listOfTasks.isNotEmpty) {
          Navigator.of(context)
              .pushReplacementNamed('/home_screen', arguments: {
            'listOfTasks': listOfTasks,
          });
        } else {
          showDialog(
              context: context,
              builder: (ctx) {
                return AppDialog(
                  message:
                      "The List of Tasks is Empty, or there is something wrong",
                );
              });
        }
      }
    }
    controller.setDynamicLoading();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

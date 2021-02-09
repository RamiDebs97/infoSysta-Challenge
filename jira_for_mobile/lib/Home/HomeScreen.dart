import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jira_for_mobile/Core%20Component/main/app_scaffold.dart';
import 'package:jira_for_mobile/Core%20Component/text/AppText.dart';
import 'package:jira_for_mobile/Home/HomeProvider.dart';
import 'package:jira_for_mobile/Home/SingleIssueItem.dart';
import 'package:jira_for_mobile/Memory/SharedPreferenceWrapper.dart';
import 'package:jira_for_mobile/Models/Issue.dart';
import 'package:jira_for_mobile/Util/Constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> allTasks = List();
  List<Issue> allIssues = List();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        Provider.of<HomeProvider>(context, listen: false).getListOfTasks());
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      allIssues = arguments['listOfTasks'];
    }
    allIssues.forEach((issue) {
      allTasks.add(IssueItem(
        summary: issue.fields.summary.toString(),
        description: issue.fields.description != null
            ? issue.fields.description.content[0].content.toString()
            : "",
        date:
            issue.fields.duedate != null ? issue.fields.duedate.toString() : "",
        reporterAvatar: issue.fields.reporter.avatarUrls,
        status: issue.fields.status.name.toString(),
        assign: issue.fields.reporter.displayName,
        reporter: issue.fields.reporter.displayName.toString(),
      ));
    });

    return Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider controller, Widget child) {
      return RefreshIndicator(
          onRefresh: () {
            return controller.getListOfTasks();
          },
          child: AppScaffold(
            onRetrySelected: controller.getListOfTasks,
            pageState: controller.pageState,
            errorMessage: controller.errorMessage,
            appBar: AppBar(
              title: AppLabelText(
                label: Constants.yourTasks,
                color: Theme.of(context).hintColor,
              ),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.nightlight_round),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: GestureDetector(
                      onTap: () async {
                        await SharedPreferenceWrapper
                                .deleteAllDataFromSharedPreference()
                            .then((value) => exit(0));
                      },
                      child: Icon(Icons.exit_to_app),
                    )),
              ],
            ),
            body: ListView(
              children: allTasks,
            ),
          ));
    });
  }
}

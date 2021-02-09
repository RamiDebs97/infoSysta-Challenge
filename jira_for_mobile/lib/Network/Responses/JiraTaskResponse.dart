import 'package:jira_for_mobile/Models/Issue.dart';

class JiraTaskResponse {
  var expand;
  var startAt;
  var maxResults;
  var total;
  List<Issue> issues;

  JiraTaskResponse(
      {this.expand, this.startAt, this.maxResults, this.total, this.issues});

  JiraTaskResponse.fromJson(Map<String, dynamic> json) {
    expand = json['expand'];
    startAt = json['startAt'];
    maxResults = json['maxResults'];
    total = json['total'];
    if (json['issues'] != null) {
      issues = new List<Issue>();
      json['issues'].forEach((v) {
        issues.add(new Issue.fromJson(v));
      });
    }
  }
}

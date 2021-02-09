import 'package:jira_for_mobile/Models/Fields.dart';

class Issue {
  Fields fields;

  Issue({this.fields});

  Issue.fromJson(Map<String, dynamic> json) {
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }
}

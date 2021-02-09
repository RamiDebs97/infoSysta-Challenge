import 'package:jira_for_mobile/Models/Assignee.dart';
import 'package:jira_for_mobile/Models/Status.dart';

class Fields {
  var description;
  var summary;
  Status status;
  var duedate;
  Assignee reporter;

  Fields({
    this.summary,
    this.reporter,
    this.duedate,
  });

  Fields.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    description = json['description'];
    summary = json['summary'];
    reporter = json['reporter'] != null
        ? new Assignee.fromJson(json['reporter'])
        : null;
  }
}

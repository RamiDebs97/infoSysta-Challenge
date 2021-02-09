import 'package:jira_for_mobile/Models/Content.dart';

class Description {
  List<Content> content;

  Description({this.content});

  Description.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
  }
}

class Assignee {
  var avatarUrls;
  var displayName;

  Assignee({
    this.avatarUrls,
    this.displayName,
  });

  Assignee.fromJson(Map<String, dynamic> json) {
    avatarUrls = json['avatarUrls'] != null ? json['avatarUrls']['32x32'] : "";
    displayName = json['displayName'];
  }
}

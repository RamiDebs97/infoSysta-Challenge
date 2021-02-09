import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Core%20Component/text/AppText.dart';
import 'package:jira_for_mobile/Util/Constants.dart';

class IssueItem extends StatelessWidget {
  final String summary;
  final String date;
  final String description;
  final String assign;
  final String reporter;
  final String status;
  final String reporterAvatar;

  const IssueItem(
      {Key key,
      this.summary,
      this.date,
      this.description,
      this.assign,
      this.reporter,
      this.status,
      this.reporterAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                subtitle: AppLabelText(
                  label: summary != null ? summary : "summary",
                  color: Theme.of(context).textSelectionColor,
                ),
                leading: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: reporterAvatar != null ? reporterAvatar : "",
                  placeholder: (context, url) =>
                      Image.asset(Constants.logoPath),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                title: AppLabelText(
                  label: reporter != null ? reporter : "Reporter",
                ),
                trailing: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: AppLabelText(
                    label: status != null ? status : "Status",
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AppLabelText(
                            label: description != null
                                ? description
                                : "Description",
                            color: Theme.of(context).textSelectionColor,
                          ),
                          flex: 80,
                        ),
                        Expanded(
                          child: Center(
                              child: AppLabelText(
                            label: date != null ? date : "Date",
                            color: Theme.of(context).textSelectionColor,
                          )),
                          flex: 20,
                        ),
                      ])),
            ]));
  }
}

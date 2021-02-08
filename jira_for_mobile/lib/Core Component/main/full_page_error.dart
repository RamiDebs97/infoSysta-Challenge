import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Core%20Component/text/AppText.dart';

class FullPageError extends StatelessWidget {
  final VoidCallback onErrorClicked;
  final String errorMessage;

  const FullPageError({Key key, this.onErrorClicked, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: AppLabelText(label: "Error"),
            ),
            RaisedButton(
              child: AppLabelText(label: 'Please Try Again'),
              onPressed: onErrorClicked,
            )
          ],
        ),
      ),
    );
  }
}

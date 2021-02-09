import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Core%20Component/enum/page_state.dart';
import 'package:jira_for_mobile/Core%20Component/main/full_page_error.dart';
import 'package:jira_for_mobile/Core%20Component/main/full_page_loader.dart';

class AppScaffold extends StatelessWidget {
  final PageState pageState;
  final PreferredSizeWidget appBar;
  final VoidCallback onRetrySelected;
  final String errorMessage;
  final Widget title;
  final Widget body;
  final bool absorbing;
  final EdgeInsets padding;
  final Key scaffoldKey;

  const AppScaffold(
      {Key key,
      this.pageState = PageState.LOADED,
      this.appBar,
      this.body,
      this.onRetrySelected,
      this.errorMessage,
      this.title,
      this.absorbing = false,
      this.padding,
      this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget pageBody;
    if (pageState == PageState.LOADING) {
      pageBody = FullPageLoader();
    } else if (pageState == PageState.ERROR) {
      pageBody = FullPageError(
        errorMessage: errorMessage,
        onErrorClicked: onRetrySelected,
      );
    } else {
      pageBody = Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title != null ? title : Container(),
            Expanded(
              child: body,
            )
          ],
        ),
      );
    }
    return AbsorbPointer(
      absorbing: absorbing,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: pageBody),
      ),
    );
  }
}

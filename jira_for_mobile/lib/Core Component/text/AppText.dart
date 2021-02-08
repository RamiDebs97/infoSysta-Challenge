import 'package:flutter/material.dart';

class AppLabelText extends StatelessWidget {
  final String label;
  const AppLabelText({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: Theme.of(context).accentColor,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.25),
    );
  }
}

import 'package:flutter/material.dart';

class FormFieldLabelText extends StatelessWidget {
  final String label;
  const FormFieldLabelText({Key key, this.label}) : super(key: key);

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
          fontSize: 12,
          height: 1.25),
    );
  }
}

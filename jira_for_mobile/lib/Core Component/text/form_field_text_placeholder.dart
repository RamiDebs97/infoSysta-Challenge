import 'package:flutter/material.dart';

class FormFieldTextPlaceHolder extends StatelessWidget {
  final String label;

  const FormFieldTextPlaceHolder({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          letterSpacing: 0.5,
          height: 1.28,
          color: Theme.of(context).hintColor),
    );
  }
}

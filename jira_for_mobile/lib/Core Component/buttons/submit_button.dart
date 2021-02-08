import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool loading;
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double elevation;

  const SubmitButton({
    Key key,
    this.loading = false,
    this.label,
    this.onPressed,
    this.color,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      elevation: elevation,
      color: color,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: loading
              ? Container(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).backgroundColor)))
              : Text(label)),
      onPressed: onPressed,
    );
  }
}

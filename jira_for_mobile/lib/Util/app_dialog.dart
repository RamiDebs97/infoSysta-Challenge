import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String message;

  const AppDialog({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              message ?? '',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}

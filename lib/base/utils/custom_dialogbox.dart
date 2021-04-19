import 'package:flutter/material.dart';

class CustomAlertBox extends StatelessWidget {
  final String title;
  final String text;
  final String button1Txt;
  final String button2Txt;
  final Function button1Tap;
  final Function button2Tap;
  const CustomAlertBox({
    Key key,
    this.title,
    this.text,
    this.button1Txt,
    this.button2Txt,
    this.button1Tap,
    this.button2Tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(button1Txt),
          onPressed: button1Tap,
        ),
        button2Txt != null
            ? TextButton(
                child: Text(button2Txt),
                onPressed: button2Tap,
              )
            : SizedBox(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gpeers/base/utils/colorsresources.dart';

Text titleText(text, textAlign, fontSize, color) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontFamily: AppFont.primaryFont,
      fontSize: fontSize,
      color: color,
      letterSpacing: 0.2,
    ),
  );
}

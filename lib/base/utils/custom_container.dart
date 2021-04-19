import 'package:flutter/material.dart';
import 'package:gpeers/base/utils/colorsresources.dart';

class CustomeContainer extends StatelessWidget {
  final Widget child;
  final Color backColor;
  const CustomeContainer({Key key, this.child, this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backColor == null
            ? ColorsResources.containerBackgroundColor
            : backColor,
      ),
      width: 300,
      height: 500,
      child: child,
    );
  }
}

class CustomeContainerFied extends StatelessWidget {
  final Widget child;
  final Color backColor;
  const CustomeContainerFied({Key key, this.child, this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backColor == null
            ? ColorsResources.containerBackgroundColor
            : backColor,
      ),
      child: child,
    );
  }
}

InputDecoration authTextInputDecoration(String hintText) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: hintText,
    counterText: '',
    hintStyle: TextStyle(
      fontSize: 16,
      color: Colors.black54,
      letterSpacing: 0,
      fontFamily: AppFont.primaryFont,
    ),
  );
}

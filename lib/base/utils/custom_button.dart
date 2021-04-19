import 'package:flutter/material.dart';

import 'colorsresources.dart';

class CustomButtonColumn extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final Color backgroundColor;
  CustomButtonColumn({this.onTap, @required this.btnTxt, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ColorsResources.bottongroundColorOne,
              ColorsResources.buttongroundColorTwo,
            ],
          ),
        ),
        child: Text(
          btnTxt,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontFamily: AppFont.primaryFont,
              ),
        ),
      ),
    );
  }
}

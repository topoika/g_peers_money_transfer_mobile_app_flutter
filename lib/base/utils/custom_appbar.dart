import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function onBackPressed;
  final Color textColor;
  CustomAppBar(
      {@required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
            fontSize: 15,
            color: textColor != null ? textColor : Colors.white,
            fontWeight: FontWeight.w500,
          )),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: textColor != null ? Colors.black : Colors.white,
                size: 15,
              ),
              color: Theme.of(context).textTheme.bodyText1.color,
              onPressed: () => onBackPressed != null
                  ? onBackPressed()
                  : Navigator.pop(context),
            )
          : SizedBox(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}

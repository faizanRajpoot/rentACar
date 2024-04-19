// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
class AjaLeadingIconButton extends StatelessWidget {
  final IconData iconData;
  final String buttonLabel;
  final Color textColor;
  final Color buttonColor;
  final Function()? onPressed;

  AjaLeadingIconButton(
      {required this.iconData, required this.buttonLabel, required this.onPressed, required this.textColor, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 46.0,
        color: buttonColor,
        textColor: textColor,
        child: Row(
          children: [
            Expanded(flex: 2, child: Icon(iconData, color: textColor,)),
            Expanded(
              flex: 8, child: Text(buttonLabel, textAlign: TextAlign.center,style: TextStyle(
              fontSize : 16,
              fontWeight:  FontWeight.w400,
            ),),),
          ],
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0),
          ),
        ),
    );
  }
}

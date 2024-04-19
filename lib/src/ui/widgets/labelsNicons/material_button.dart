import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AjaMaterialButton extends StatelessWidget {
  final String buttonLabel;
  final onPressed;
  final Color buttonColor;
  final Color? buttonLabelColor;
  AjaMaterialButton(
      {required this.buttonLabel,
      required this.onPressed,
      required this.buttonColor,
      this.buttonLabelColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: Get.height * 0.060,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: buttonLabelColor,
          ),
        ),
      ),
    );
  }
}

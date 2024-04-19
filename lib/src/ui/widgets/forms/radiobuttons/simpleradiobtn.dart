import 'package:flutter/material.dart';

class SimpleRadioBtn extends StatelessWidget {
  final Object btnvalue;
  final String btntxt;
  final Function(Object?)? btnfunction;
  final Color activeColor;

  SimpleRadioBtn(
      {required this.btnvalue,
      required this.btntxt,
      required this.btnfunction,
      required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: btntxt,
      groupValue: btnvalue,
      onChanged: btnfunction,
      activeColor: activeColor,
    );
  }
}

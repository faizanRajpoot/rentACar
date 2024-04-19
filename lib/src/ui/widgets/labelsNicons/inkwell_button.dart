// flutter imports
import 'package:flutter/material.dart';

// package imports
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';



class AjaInkWellButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final Color? buttonColor;
  AjaInkWellButton(
      {required this.onPressed, required this.icon, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: Get.height * 0.060,
        width: Get.width * 0.13,
        color: buttonColor,
        child: Icon(icon, color: UIDataColors.white),
      ),
    );
  }
}

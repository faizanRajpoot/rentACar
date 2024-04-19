// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';


class LogoutButton extends StatelessWidget {
  final Function()? onPressed;
  const LogoutButton({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 54.0,
        width: Get.width,
        padding: EdgeInsets.only(left: 26, top: 18, bottom: 14.0),
        child: Text(
          'Logout',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: UIDataColors.commonColor,
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xfff6f7ff).withOpacity(0.1),
        ),
      ),
    );
  }
}

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightIconWhiteContainer extends StatelessWidget {
  final double height;
  final String title;
  final bool isIconEnable;
  final Function()? onPressed;
  RightIconWhiteContainer(
      {required this.height,
      required this.title,
      required this.isIconEnable,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: Get.width,
        padding: EdgeInsets.only(left: 26, top: 18, bottom: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Color(0xff3e3f68),
              ),
            ),
            isIconEnable
                ? Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xff8a98ba),
                  )
                : Text(''),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xfff6f7ff).withOpacity(0.1),
        ),
      ),
    );
  }
}

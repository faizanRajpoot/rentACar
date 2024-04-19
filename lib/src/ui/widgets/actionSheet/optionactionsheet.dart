import '../../../utils/config/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class OptionActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Share App',
                    style: UIDataTextStyles.kForgotPassword,
                  ),
                  Icon(
                    Icons.share,
                    color: UIDataColors.green300,
                  )
                ],
              )),
          CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'More by this Developer',
                  style: UIDataTextStyles.kForgotPassword,
                ),
                Icon(
                  Icons.supervised_user_circle,
                  color: UIDataColors.green300,
                )
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: UIDataTextStyles.kForgotPassword,
            )),
      );
  }
}
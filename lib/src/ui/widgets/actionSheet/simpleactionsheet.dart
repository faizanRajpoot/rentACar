import '../../../utils/config/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SimpleActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        'Cupertino Action Sheet Example',
        style: UIDataTextStyles.kForgotPassword,
      ),
      message: Text('It\'s a demo for cupertino action sheet.'),
      actions: [
        CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: Text('OK', style: UIDataTextStyles.kForgotPassword))
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

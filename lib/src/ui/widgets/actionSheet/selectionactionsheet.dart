// ignore_for_file: sort_child_properties_last

import '../../../utils/config/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SelectionActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Get.back();
          },
          child: Text(' 💁‍♂️ Male', style: UIDataTextStyles.kForgotPassword),
          isDefaultAction: true,
        ),
        CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child:
                Text(' 💁‍♀️ Female', style: UIDataTextStyles.kForgotPassword))
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

// class GenderSelection extends StatefulWidget {
//   @override
//   GenderSelectionState createState() => GenderSelectionState();
// }

// class GenderSelectionState extends State<GenderSelection> {
//   late String gender;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         RadioListTile(
//           title: Text('Male'),
//           value: 'male',
//           groupValue: gender,
//           onChanged: (value) {
//             setState(() {
//               gender = value!;
//             });
//           },
//         ),
//         RadioListTile(
//           title: Text('Female'),
//           value: 'female',
//           groupValue: gender,
//           onChanged: (value) {
//             setState(() {
//               gender = value!;
//             });
//           },
//         ),
//         RadioListTile(
//           title: Text('Other'),
//           value: 'other',
//           groupValue: gender,
//           onChanged: (value) {
//             setState(() {
//               gender = value!;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }

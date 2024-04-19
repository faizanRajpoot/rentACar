
import 'package:flutter/material.dart';

import '../../../../utils/config/uidata.dart';

class RationbtnPic extends StatelessWidget {
  final bool btnvalue;
  final Color btnclrActive;
  final Color btnclrcheck;
  final Function(Object?)? btnfunction;
  final String titletext;
  final String subtitletext;
  final Icon btnIcon;
  final String img;
  final String btnvaluetxt;

  RationbtnPic({
    required this.btnvalue,
    required this.btnclrActive,
    required this.btnclrcheck,
    required this.btnfunction,
    required this.titletext,
    required this.btnIcon,
    required this.btnvaluetxt,
    required this.img,
    required this.subtitletext,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: UIDataColors.white30,
        ),
        child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset(
                  '$img',
                ).image),
                shape: BoxShape.circle,
              ),
            ),
            title: Text(
              titletext,
              style: UIDataTextStyles.kFormFieldLableStyle,
            ),
            subtitle: Text(
              subtitletext,
              style: UIDataTextStyles.kReminderHintStyle,
            ),
            value: btnvaluetxt,
            groupValue: btnvalue,
            onChanged: btnfunction),
      ),
    );
  }
}

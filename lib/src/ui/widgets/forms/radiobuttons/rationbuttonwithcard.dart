import '../../../../utils/config/uidata.dart';
import 'package:flutter/material.dart';

class RationBtnWIthCard extends StatelessWidget {

  final bool btnvalue;
  final Color btnclrActive;
  final Color btnclrcheck;
  final Function(Object?)? btnfunction;
  final String titletext;
  final String subtitletext;
  final Icon btnIcon;
  final String btntxt;

  RationBtnWIthCard({
    required this.btnvalue,
    required this.btnclrActive,
    required this.btnclrcheck,
    required this.btnfunction,
    required this.titletext,
    required this.btnIcon,
    required this.subtitletext,
    required this.btntxt,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: UIDataColors.white30,
        ),
        child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              titletext,
              style: UIDataTextStyles.kFormFieldLableStyle,
            ),
            subtitle: Text(
              subtitletext,
              style:  UIDataTextStyles.kReminderHintStyle,
            ),
            value: btntxt,
            groupValue: btnvalue,
            onChanged: btnfunction,
      ),
    ));
  }
}

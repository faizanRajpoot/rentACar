import 'package:flutter/material.dart';

import '../../../utils/config/uidata.dart';


class TextLabel extends StatelessWidget {
  final String label;
  final Color? labelColor;
  const TextLabel({
    required this.label,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
        fontSize: 16.0,
        color: labelColor ?? UIDataColors.commonColor,
      ),
      textScaleFactor: 0.85,
    );
  }
}

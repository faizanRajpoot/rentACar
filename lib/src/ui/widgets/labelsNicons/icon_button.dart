import 'package:flutter/material.dart';

class AjaIconButton extends StatelessWidget {
  final Icon icon;
  final Function()? onPressed;
  final double? iconSize;
  final Color? iconColor;

  AjaIconButton(
      {required this.icon,
      required this.onPressed,
      this.iconSize,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: iconSize ?? 20,
      color: iconColor,
    );
  }
}

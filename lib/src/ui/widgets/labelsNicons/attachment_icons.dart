import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttachmentIcons extends StatelessWidget {
  AttachmentIcons(
      {this.onTap, required this.label, this.icon, this.color, this.textStyle});
  final String label;
  final Function()? onTap;
  final Color? color;
  final dynamic icon;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 25,
            child: icon.runtimeType == IconData ||
                    icon.runtimeType == IconDataSolid
                ? Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  )
                : icon,
          ),
        ),
        SizedBox(height: 10),
        textStyle != null
            ? Flexible(
                child: Text(
                  label,
                  style: textStyle,
                ),
              )
            : Flexible(child: Text(label))
      ],
    );
  }
}

class AttachmentIconsH extends StatelessWidget {
  AttachmentIconsH(
      {this.onTap, required this.label, this.icon, this.color, this.textStyle});
  final String label;
  final Function()? onTap;
  final Color? color;
  final dynamic icon;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 18,
            child: icon.runtimeType == IconData ||
                    icon.runtimeType == IconDataSolid
                ? Icon(
                    icon,
                    size: 20,
                    color: Colors.white,
                  )
                : icon,
          ),
        ),
        SizedBox(width: 10),
        textStyle != null
            ? Flexible(
                child: Text(
                  label,
                  style: textStyle,
                ),
              )
            : Flexible(
                child: Text(label),
              )
      ],
    );
  }
}

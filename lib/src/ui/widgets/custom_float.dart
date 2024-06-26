// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../../utils/config/uidata.dart';

class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget? builder;
  final VoidCallback? qrCallback;
  final isMini;

  CustomFloat({required this.icon, this.builder, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      backgroundColor: Colors.white,
      child: Ink(
        // decoration: new BoxDecoration(
          // gradient: new LinearGradient(colors: UIData.kitGradients)
        // ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: UIDataColors.commonColor,
            ),
            builder != null
                ? Positioned(
                    right: 7.0,
                    top: 7.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: builder,
                      radius: 10.0,
                    ),
                  )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}

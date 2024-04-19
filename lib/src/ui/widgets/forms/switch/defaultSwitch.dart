import 'package:flutter/material.dart';

class DefaultSwitch extends StatelessWidget {
  final bool btnvalue;
  final Function(bool)? btnfunction;
  final Color activeclr;

  DefaultSwitch({required this.btnvalue, required this.btnfunction, required this.activeclr});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: btnvalue,
      onChanged: btnfunction,
      // activeTrackColor: Colors.lightGreenAccent,
      activeColor: activeclr,
    );
  }
}

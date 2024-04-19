import 'package:flutter/material.dart';

class CustomeImgSwitch extends StatelessWidget {
  
  final bool btnvalue;
  final Function(bool)? btnfunction;
  final Color activeclr;
  final String imgoff;
  final String imgOn;

  CustomeImgSwitch(
      {required this.btnvalue,
      required this.btnfunction,
      required this.activeclr,
      required this.imgoff,
      required this.imgOn});

  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveThumbImage: Image.asset('$imgoff').image,
      inactiveThumbColor: Colors.transparent,
      inactiveTrackColor: Color(0xFF848B9B),
      activeThumbImage: Image.asset(
              '$imgOn')
          .image,
      hoverColor: Colors.red,
      value: btnvalue,
      onChanged: btnfunction,
      activeTrackColor: Colors.orangeAccent,
      activeColor: activeclr,
    );
  }
}

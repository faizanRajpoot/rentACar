import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/config/uidata.dart';

class CommonSearchBar extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      height: Get.height / 18,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextField(
        cursorHeight: 20,
        style: TextStyle(color: UIDataColors.commonblackColor, fontSize: 20),
        autofocus: false,
        controller: TextEditingController(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.black),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent, width: 1.5)),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
        ),
      ),
    );
  }
}

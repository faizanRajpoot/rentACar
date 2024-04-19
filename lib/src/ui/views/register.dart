// flutter imports

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rent_a_car_skeleton/src/controllers/register_controller.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';

// widgets

//Dynamic list

class RegisterScreen extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: UIDataColors.commonblackColor,
            // margin: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      // color: UIDataColors.commonblackColor,
                      child: Row(
                    children: const [
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  )).marginSymmetric(vertical: 20),
                  Column(
                    children: [
                      TextField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Enter your Name",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(bottom: 25),
                      TextField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Enter your Father Name",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(bottom: 25),
                      TextField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Phone No. 1",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(bottom: 25),
                      TextField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Phone No. 2",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(bottom: 25),
                      TextField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        controller: TextEditingController(),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "City",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(bottom: 25),
                      TextField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(bottom: 25),
                      Container(
                        width: Get.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UIDataColors.commontextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(radiusCircular(50)),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.DashboardRoute);
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ).paddingSymmetric(vertical: 5),
                        ),
                      ).marginSymmetric(horizontal: 90, vertical: 10),
                    ],
                  ),
                ],
              ),
            ),
          ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 15),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(context),
      showDrawer: false,
      enableHeader: false,
      headerName: false,
      showFAB: false,
      showAppBar: false,
      elevation: 0.0,
      appTitle: " ",
      backGroundColor: UIDataColors.commonblackColor,
      showBottomNav: false,
      actionFirstIcon: false,
    );
  }
}

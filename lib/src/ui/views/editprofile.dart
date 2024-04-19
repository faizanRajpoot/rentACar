// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// package imports
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../controllers/editProfile_controller.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/forms/radiobuttons/simpleradiobtn.dart';

class EditProfile extends StatelessWidget {
  // final GenderController genderController = Get.put(GenderController());

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
                children: <Widget>[
                  Container(
                    color: UIDataColors.commonblackColor,
                    height: Get.height / 19,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                )),
                            Text(
                              "Edit Profile",
                              // textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 10),
                  Stack(children: [
                    Obx(
                      () => Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: _.auth.profileImage.value.isEmpty
                                ? AssetImage('assets/images/user.png')
                                    as ImageProvider
                                : FileImage(
                                    File(
                                      _.auth.profileImage.value,
                                    ),
                                  ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ).marginOnly(top: 10),
                    GestureDetector(
                      onTap: () {
                        _.auth.selectImage();
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.black,
                        ),
                      ).marginOnly(left: 90, top: 70),
                    )
                  ]),
                  Column(
                    children: [
                      TextFormField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        controller: TextEditingController(),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorHeight: 20,
                        textCapitalization: TextCapitalization.sentences,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        controller: TextEditingController(),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "Nick Name",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          
                        ),
                      ).marginOnly(top: 20),
                      TextFormField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ).marginOnly(top: 20),
                      TextFormField(
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          hintText: "Date Of Birth",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                        controller: _.dateCtl,
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          _.dateCtl.text = date!.toIso8601String();
                        },
                      ).marginOnly(top: 20),
                      IntlPhoneField(
                        dropdownTextStyle: TextStyle(color: Colors.white),
                        dropdownIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        //dropdownDecoration: BoxDecoration(color: Colors.white),
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          // filled: true,
                          // fillColor: Colors.white,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                        initialCountryCode: 'PK',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                          Colors.white;
                        },
                      ).marginOnly(top: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Men'),
                                  SimpleRadioBtn(
                                    btnvalue: _.radio,
                                    btntxt: "Men",
                                    btnfunction: _.radioCallBack,
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Female'),
                                  SimpleRadioBtn(
                                    btnvalue: _.radio,
                                    btntxt: "Female",
                                    btnfunction: _.radioCallBack,
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('N/A'),
                                  SimpleRadioBtn(
                                      btnvalue: _.radio,
                                      btntxt: "N/A",
                                      btnfunction: _.radioCallBack,
                                      activeColor: Colors.white),
                                ],
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 20),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.ProfileRoute);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 75, 75, 75),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ).paddingSymmetric(vertical: 8),
                            ),
                          ).marginOnly(top: 20)
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 20, horizontal: 20),
                ],
              ),
            ),
          ),
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

// package imports
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';

class Profile extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // color: UIDataColors.commonblackColor,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: UIDataColors.commonblackColor,
                    height: Get.height / 19,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
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
                              "Profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 10),
                  Stack(children: [
                    Obx(() => Container(
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
                        )),
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
                  Text("Talha Anwar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold))
                      .marginOnly(top: 5),
                  Text(
                    "+92 308 4522212",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ).marginOnly(top: 5),
                  Container(width: Get.width, height: .2, color: Colors.white)
                      .marginOnly(top: 15),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                Routes.ProfileRoute + Routes.EditProfileRoute);
                          },
                          child: Container(
                            width: Get.width,
                            height: Get.height / 16.5,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                Text("Edit Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 1,
                                    )).marginOnly(left: 10),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 25),
                          ).paddingSymmetric(vertical: 5)),
                    ],
                  ).marginOnly(top: 10),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: Colors.white,
                            ),
                            Text("Adress",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.NotificationRoute);
                      },
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                            ),
                            Text("Notification",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.wallet,
                              color: Colors.white,
                            ),
                            Text("Payment",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.security,
                              color: Colors.white,
                            ),
                            Text("Security",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            Text("Privacy Policy",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_center_outlined,
                              color: Colors.white,
                            ),
                            Text("Help Support",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.people_outline,
                              color: Colors.white,
                            ),
                            Text("Invite Friend",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
                  GestureDetector(
                      onTap: () {
                        _.auth.getLoggedOutUser();
                      },
                      child: Container(
                        width: Get.width,
                        height: Get.height / 16.5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            Text("Log Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                )).marginOnly(left: 10),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25),
                      ).paddingSymmetric(vertical: 5)),
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
      showBottomNav: true,
      actionFirstIcon: false,
    );
  }
}

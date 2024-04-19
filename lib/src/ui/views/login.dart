// package imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/login_controller.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';

class LoginScreen extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(75.0),
                          bottomRight: Radius.circular(75.0))),
                  child: Image.asset(
                    'assets/images/carlogo.png',
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome To Tuber",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(GooleLogin());
                  Get.snackbar(
                      "Coming Soon", 'This Feature is not yet available',
                      colorText: UIDataColors.white);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon/google.png',
                        width: 24,
                        height: 24,
                      ).paddingOnly(left: 25),
                      Text(
                        "Login With Google",
                        style: TextStyle(
                            color: UIDataColors.commonColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ).paddingOnly(left: 30),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(FacebookLogin());
                  Get.snackbar(
                      "Coming Soon", 'This Feature is not yet available',
                      colorText: UIDataColors.white);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon/facebook.png',
                        width: 24,
                        height: 24,
                      ).paddingOnly(left: 25),
                      Text(
                        "Login With Facebook",
                        style: TextStyle(
                            color: UIDataColors.commonColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ).paddingOnly(left: 30),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(AppleLogin());
                  Get.snackbar(
                      "Coming Soon", 'This Feature is not yet available',
                      colorText: UIDataColors.white);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon/apple.png',
                        width: 24,
                        height: 24,
                      ).paddingOnly(left: 25),
                      Text(
                        "Login With Apple",
                        style: TextStyle(
                            color: UIDataColors.commonColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ).paddingOnly(left: 30),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: UIDataColors.commonColor,
                  ),
                  Container(
                    // alignment: Alignment.center,
                    color: UIDataColors.commonblackColor,
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: UIDataColors.commontextColor, fontSize: 30),
                    ).paddingAll(5).paddingSymmetric(horizontal: 10),
                  ),
                ],
              ).paddingSymmetric(vertical: 35),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SignInRoute);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                      // color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: UIDataColors.commonColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ).paddingSymmetric(
                    vertical: 6,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SignUpRoute);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 75, 75),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: UIDataColors.commonColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ).paddingSymmetric(
                    vertical: 6,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(
              vertical: Get.height / 20, horizontal: Get.width / 20),
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
      backGroundColor: UIDataColors.commonblackColor,
      showBottomNav: false,
      actionFirstIcon: false,
    );
  }
}

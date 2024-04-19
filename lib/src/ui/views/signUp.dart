// package imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_a_car_skeleton/src/controllers/SignUp_controller.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';

class SignUpScreen extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: UIDataColors.commonblackColor,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.dangerous),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        Get.toNamed(Routes.loginRoute);
                      },
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 75, 75, 75),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                        topLeft: Radius.circular(75.0),
                        bottomRight: Radius.circular(75.0))),
                child:
                    Lottie.asset("assets/lottie/14717-sedan-car-animation.json")
                        .paddingSymmetric(vertical: 20),
              ).marginSymmetric(horizontal: 60),
              SizedBox(
                height: 20,
              ),
              Text(
                "SignUp with Tuber New Account",
                style: TextStyle(
                    color: UIDataColors.commonColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorHeight: 20,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _.firstName,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorHeight: 20,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _.lastName,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: "Last Name",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorHeight: 20,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _.username,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorHeight: 20,
                obscureText: _.isPasswordHidden,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _.password,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _.isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _.togglePassword();
                    },
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorHeight: 20,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _.cnic,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  hintText: "Cnic",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorHeight: 20,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _.phoneNo,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  hintText: "Phone No",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  _.signUp();
                  // Get.toNamed(Routes.DashboardRoute);
                },
                child: Container(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 75, 75, 75),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      "SignUp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: UIDataColors.commonColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ).paddingSymmetric(
                      vertical: 10,
                    ),
                  ),
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
                      "Or continue with",
                      style: TextStyle(
                          color: UIDataColors.commontextColor, fontSize: 16),
                    ).paddingAll(5).paddingSymmetric(horizontal: 10),
                  ),
                ],
              ).paddingOnly(top: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You Have Already Account ? ",
                    style: TextStyle(
                        color: UIDataColors.commonColor, fontSize: 20),
                  ),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: UIDataColors.commonColor,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.SignInRoute);
                    },
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
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

  void setState(Null Function() param0) {}
}

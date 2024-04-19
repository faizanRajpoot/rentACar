// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/models/signUp.dart';
import '../models/error.dart';
import '../services/auth_service.dart';
import '../services/restclient.dart';
import '../utils/routes/app_routes.dart';

class SignUpController extends GetxController {
  AuthService auth = Get.find<AuthService>();
  RestClient restClient = Get.find<RestClient>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  bool? checkboxT;
  bool isPasswordHidden = true;

  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  Future<void> login() async {
    try {
      bool success = await auth.login(username.text, password.text);
      if (success) {
        Get.offAndToNamed(Routes.DashboardRoute);
      }
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
    }
  }

  // void submitSignUp() async {
  //   try {
  //     SignUp signUp = SignUp(
  //       firstName: firstName.text,
  //       lastName: lastName.text,
  //       email: username.text,
  //       password: password.text,
  //       cnic: cnic.text,
  //       phoneNo: phoneNo.text,
  //     );
  //     var res = await restClient.sendRequest(
  //       '/method/signup',
  //       data: signUp.toJson(),
  //       type: RequestType.post,
  //     );
  //     // await login();
  //   } catch (e, s) {
  //     print(e);
  //     print('hello $s');
  //     e as ErrorResponse;
  //     print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
  //     ////////////////////////////////
  //     firstName.clear();
  //     lastName.clear();
  //     username.clear();
  //     password.clear();
  //     cnic.clear();
  //     phoneNo.clear();
  //   }
  // }

  Future<void> signUp() async {
    try {
      bool success = await auth.register(SignUp(
        firstName: firstName.text,
        lastName: lastName.text,
        email: username.text,
        password: password.text,
        cnic: cnic.text,
        phoneNo: phoneNo.text,
      ));
      if (success) {
        Get.offAndToNamed(Routes.DashboardRoute);
      }
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
    }
  }
}

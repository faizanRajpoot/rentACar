import 'package:flutter/material.dart';
import 'package:rent_a_car_skeleton/src/models/error.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../utils/routes/app_routes.dart';

class SignInController extends GetxController {
  AuthService authService = Get.find<AuthService>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? checkboxT;
  bool isPasswordHidden = true;

  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  Future<void> login() async {
    try {
      bool success = await authService.login(username.text, password.text);
      if (success) {
        Get.offAndToNamed(Routes.DashboardRoute);
      }
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
    }
  }

  // Future<void> getUsers() async {
  //   // var res = await restClient.sendRequest('/resource/Sales Order');
  //   // print(res);
  // }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class RegisterController extends GetxController {
  AuthService auth = Get.find<AuthService>();
  bool isLoading = true;
  @override
  void onInit() async {
    await auth.loadProfileImagePath();
    isLoading = false;
    super.onInit();
  }

  @override
  void onReady() {
    update();
    super.onReady();
  }

  String radio = '';

  void radioCallBack(Object? value) {
    // print(value);
    radio = value.toString();
    update();
  }

  TextEditingController dateCtl = TextEditingController();

  TextEditingController userGenderController = TextEditingController();
}

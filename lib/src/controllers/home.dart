import 'package:flutter/material.dart';
import 'package:rent_a_car_skeleton/src/models/login.dart';
import 'package:rent_a_car_skeleton/src/models/error.dart';
import 'package:rent_a_car_skeleton/src/services/restclient.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RestClient restClient = Get.find<RestClient>();

  Future<void> login() async {
    LoginRequest req = LoginRequest.fromJson({
      'usr': username.text,
      'pwd': password.text,
      'device': 'mobile',
    });
    try {
      LoginResponse res = await restClient.login(req);
      print(res.toJson().toString());
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
    }
  }

  Future<void> getUsers() async {
    var res = await restClient.sendRequest('/resource/Sales Order');
    print(res);
  }
}

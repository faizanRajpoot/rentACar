// ignore_for_file: overridden_fields

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../services/auth_service.dart';
import '../utils/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  final priority = 0;
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    // printInfo(info: 'logged in user ${authService.loggedInUser} ${authService.loggedInUser!=0}');
    // if(authService.loggedInUser!=0)
    // printInfo(info: 'activeAccount ${authService.activeAccount.toMap().toString()}');
    return authService.isLoggedIn()
        ? null
        : RouteSettings(name: Routes.introRoute);
  }
}

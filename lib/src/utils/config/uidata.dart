library uidata;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

part '../uidata/color.dart';
part '../uidata/text_styles.dart';
part '../uidata/image.dart';
part '../uidata/vector.dart';
part '../uidata/icon.dart';
part '../uidata/font.dart';
part '../uidata/spacing.dart';

class UIData {
  //strings
  static const String appName = "rent_a_car_skeleton";

  //login
  static const String enter_code_label = "Phone Number";
  static const String enter_code_hint = "10 Digit Phone Number";
  static const String enter_otp_label = "OTP";
  static const String enter_otp_hint = "4 Digit OTP";
  static const String get_otp = "Get OTP";
  static const String resend_otp = "Resend OTP";
  static const String login = "Login";
  static const String enter_valid_number = "Enter 10 digit phone number";
  static const String enter_valid_otp = "Enter 4 digit otp";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String forgot_password = "Forgot Password?";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  //  Page Orientation Dimentions
  static final double responsiveHeight = (Get.height.ceil()).toDouble();
  static final double responsiveWidth = (Get.width.ceil()).toDouble();
}

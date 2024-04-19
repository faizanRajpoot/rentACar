import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/SignIn_controller.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

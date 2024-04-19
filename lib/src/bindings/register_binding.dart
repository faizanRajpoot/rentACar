import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}

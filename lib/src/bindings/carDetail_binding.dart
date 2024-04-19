
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/carDetail_controller.dart';

class AboutCarBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<CarDetailController>(() => CarDetailController());
  }
}
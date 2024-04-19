
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/brandItem_controller.dart';

class BrandItemBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<BrandItemController>(() => BrandItemController());
  }
}
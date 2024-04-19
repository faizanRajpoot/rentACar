import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/LikedCard_controller.dart';

class LikedCardBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<LikedCardController>(() => LikedCardController());
  }
}
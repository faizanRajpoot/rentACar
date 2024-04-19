import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}


import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/booking_controller.dart';

class BookingBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(() => BookingController());
  }
}
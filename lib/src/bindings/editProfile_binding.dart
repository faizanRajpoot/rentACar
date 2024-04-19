import 'package:get/get.dart';
import '../controllers/editProfile_controller.dart';

class EditProfileBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
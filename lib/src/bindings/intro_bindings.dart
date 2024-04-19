import 'package:get/get.dart';
import '../controllers/intro.dart';

class IntroBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }
}

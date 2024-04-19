import 'package:get/get.dart';
import '../controllers/ItemDetail_controller.dart';

class ItemDetailBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<ItemDetailController>(() => ItemDetailController());
  }
}
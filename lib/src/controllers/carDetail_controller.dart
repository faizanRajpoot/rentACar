import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/services/restclient.dart';
import '../services/auth_service.dart';
import '../utils/helpers/frappe_helper.dart';

class CarDetailController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  AuthService auth = Get.find<AuthService>();
  final FrappeHelper frappeHelper = FrappeHelper();
  var isLoading = true.obs;
  dynamic args;


  @override
  void onReady() async {
    await frappeHelper.getItemData();
    args = Get.arguments;
    // a = Get.arguments;
    isLoading.value = false;
    print(isLoading);
    super.onReady();
  }
}

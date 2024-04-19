import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/services/auth_service.dart';
import '../services/restclient.dart';
import '../utils/helpers/frappe_helper.dart';

class ItemDetailController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  AuthService auth = Get.find<AuthService>();
  final FrappeHelper frappeHelper = FrappeHelper();
  bool isLoading = true;
  bool isFav = true;
  final List<int> selectedCardIndices = [];
  dynamic args;

  @override
  void onReady() async {
    await frappeHelper.getItemData();
    args = Get.arguments;
    isLoading = false;
    super.onReady();
    update();
  }

  void toggleFav(int index) {
    if (selectedCardIndices.contains(index)) {
      selectedCardIndices.remove(index);
    } else {
      selectedCardIndices.add(index);
    }
    update();
  }

  bool isCardSelected(int index) {
    return selectedCardIndices.contains(index);
  }
}

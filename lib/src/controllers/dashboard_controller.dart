import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/services/auth_service.dart';
import 'package:rent_a_car_skeleton/src/utils/helpers/frappe_helper.dart';
import '../models/banners.dart';
import '../services/restclient.dart';

class DashboardController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  AuthService auth = Get.find<AuthService>();
  bool isLoading = true;
  bool isFav = true;
  final List<int> selectedCardIndices = [];
  final FrappeHelper frappeHelper = FrappeHelper();
  List<WebBanner>? banners;
  late final int index;

  @override
  void onInit() async {
    await auth.loadProfileImagePath();
    super.onInit();
  }

  @override
  void onReady() async {
    await getData();
    await frappeHelper.getItemData();
    await frappeHelper.getVehiclaData();

    isLoading = false;
    update();
    super.onReady();
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

  // Map

  Future<void> getData() async {
    try {
      dynamic res = await restClient.sendRequest(
          '/resource/Web Page/mobile-banner',
          type: RequestType.get);
      banners = Banners.fromJson(res).pageBlocks!.first.webTemplateValues;
      update();
    } catch (e, s) {
      print("Banner Error: $e");
      print("Banner Stack: $s");
    }
  }
}

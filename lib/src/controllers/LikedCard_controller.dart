// ignore_for_file: unnecessary_overrides, non_constant_identifier_names

import 'package:get/get.dart';

import '../models/items.dart';
import '../services/auth_service.dart';
import '../services/restclient.dart';

class LikedCardController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  AuthService auth = Get.find<AuthService>();
  List<Item>? Items;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getDataItem() async {
    try {
      var resItem =
          await restClient.sendRequest('/method/item', type: RequestType.get);
      Items = itemListFromJson(resItem);
      update();
    } catch (e, s) {
      print("Item Error: $e");
      print("Item Stack: $s");
    }
  }
}

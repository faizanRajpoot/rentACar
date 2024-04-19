

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/items.dart';
import '../services/restclient.dart';

class BookingController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  List<Item>? Items;
  bool isLoading = true;
  bool calender = true;

  TextEditingController customer = TextEditingController();
  TextEditingController dateCtl2 = TextEditingController();
  TextEditingController dateCtl3 = TextEditingController();

  dynamic refValue;

  
  int index = Get.arguments?['index'] ?? 0;

  @override
  void onReady() async {
    await getDataItem();
    isLoading = false;
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

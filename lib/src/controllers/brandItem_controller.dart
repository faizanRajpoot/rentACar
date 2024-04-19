
// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/services/restclient.dart';
import '../models/items.dart';
import '../services/auth_service.dart';
import '../utils/helpers/frappe_helper.dart';

class BrandItemController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  AuthService auth = Get.find<AuthService>();
  final FrappeHelper frappeHelper = FrappeHelper();
  bool isLoading = true;
  List<Item>? Items = [];
  final List<int> selectedCardIndices = [];
  dynamic args;

  @override
  void onReady() async {
    args = Get.arguments;
    await getItemData();
    isLoading = false;
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

  Future<void> getItemData() async {
    await frappeHelper.getItem(
      doctype: "Item",
      fields:
          '["item_code","image","item_name","item_group","standard_rate","vehicle_color","vehicle_model","vehicle_engine_type","vehicle_type","vehicle_year","vehicle_horse_power","initial_mileage","average_km_per_gallon","vin","license_plate","license_expiry_date","vehicle_make"]',
      filters: [
        ["Item", "item_code", "not like", "%service%"],
        ["Item", "disabled", "in", "no"],
        ["Item", "vehicle_make", "in", "${args.name}"]
      ],
    );
    // print(frappeHelper.response);
    // List<Item> res = [];
    // print(Item());

    frappeHelper.response.forEach((e) {
      // print( e['standard_rate']);
      Items?.add(Item.fromJson({
        'name': e['item_name'],
        'image': e['image'],
        'itemCode': e['itemCode'],
        'priceListRate': e['standard_rate'],
        'vehicleModel': e['vehicle_model'],
      }));
    });
    isLoading = false;
    update();
  }
}

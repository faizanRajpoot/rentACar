import 'dart:convert';

import 'package:get/get.dart';
import '../../models/brands.dart';
import '../../models/error.dart';
import '../../models/items.dart';
import '../../services/restclient.dart';

class FrappeHelper {
  RestClient restClient = Get.find<RestClient>();

  List<Brand>? brands = [];
  List<Item>? items = [];

  List<Map<String, dynamic>> _response = [];

  get response => _response;
  // Future<void> getItem() async {
  //   try {
  //     Map<String, dynamic> params = {
  //       "doctype": "Item",
  //       "fields":
  //           '["item_code","image","item_name","item_group","standard_rate","vehicle_color","vehicle_model","vehicle_engine_type","vehicle_type","vehicle_year","vehicle_horse_power","initial_mileage","average_km_per_gallon","vin","license_plate","license_expiry_date","vehicle_make"]',
  //       "filters": '[["Item", "item_code", "not like", "%service%"]]',
  //       "order_by": " modified DESC",
  //       "start": 0,
  //       "page_length": 20,
  //       "view": "List",
  //       "group_by": "name",
  //       "with_comment_count": true,
  //     };
  //     dynamic resItems = await restClient.sendRequest(
  //         '/method/frappe.desk.reportview.get',
  //         type: RequestType.get,
  //         data: params);
  //     print(resItems);
  //   } on ErrorResponse catch (e) {
  //     print(e.statusMessage);
  //   } catch (e, s) {
  //     print("error $e");
  //     print("stack $s");
  //   }
  // }

  Future<void> getItem({
    required String doctype,
    required String fields,
    required List<List<String>> filters,
    String orderBy = "modified DESC",
    int start = 0,
    int pageLength = 20,
    String view = "List",
    String groupBy = "name",
    bool withCommentCount = true,
  }) async {
    try {
      Map<String, dynamic> params = {
        "doctype": doctype,
        "fields": fields,
        "filters": jsonEncode(filters),
        "order_by": orderBy,
        "start": start,
        "page_length": pageLength,
        "view": view,
        "group_by": groupBy,
        "with_comment_count": withCommentCount,
      };
      dynamic resItems = await restClient.sendRequest(
          '/method/frappe.desk.reportview.get',
          type: RequestType.post,
          data: params);
      parseResponse(resItems);
    } on ErrorResponse catch (e) {
      print(e.statusMessage);
    } catch (e, s) {
      print("error $e");
      print("stack $s");
    }
  }

  void parseResponse(dynamic data) {
    // print(data);
    List<Map<String, dynamic>> l = [];
    try {
      data as Map<String, dynamic>;
      List values = data['values'];
      data['keys'] as List<dynamic>;
      Map<String, dynamic> r = {};
      int i = 0;
      for (var d in values) {
        r = {};
        i = 0;
        for (var v in d) {
          r[data['keys'][i]] = v.toString();
          i++;
        }

        l.add(r);
      }
    } catch (e) {
      // do nothing
    }
    _response = l;
  }

  Future<void> getItemData() async {
    await getItem(
      doctype: "Item",
      fields:
          '["item_code","image","item_name","item_group","standard_rate","vehicle_color","vehicle_model","vehicle_engine_type","vehicle_type","vehicle_year","vehicle_horse_power","initial_mileage","average_km_per_gallon","vin","license_plate","license_expiry_date","vehicle_make"]',
      filters: [
        ["Item", "item_code", "not like", "%service%"],
        ["Item", "disabled", "in", "no"],
        
      ],
    );

    response.forEach((e) {
      items?.add(Item.fromJson({
        'itemCode': e['itemCode'],
        'name': e['item_name'],
        'image': e['image'],
        'priceListRate': e['standard_rate'],
        'vehicleColor': e['vehicle_color'],
        'vehicleModel': e['vehicle_model'],
        'vehicleEngineType': e['vehicle_engine_type'],
        'vehicleType': e['vehicle_type'],
        'vehicleYear': e['vehicle_year'],
        'vehicleHorsePower': e['vehicle_horse_power'],
        'vehicleMake': e['item_group'],
        'initialMileage': e['initial_mileage'],
        'licensePlate': e['license_plate'],
        // 'initialMileage': e['initial_mileage'],
        // 'initialMileage': e['initial_mileage'],
      }));
    });
  }

  Future<void> getVehiclaData() async {
    await getItem(
      doctype: "Vehicle Maker",
      fields: '["name","image"]',
      filters: [],
    );
    response.forEach((e) {
      brands?.add(Brand.fromJson({
        'name': e['name'],
        'image': e['image'],
      }));
    });
  }
}

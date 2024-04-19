List<Item> itemListFromJson(dynamic str) =>
    List<Item>.from(str.map!((x) => Item.fromJson(x)));

class Item {
  String? name;
  String? image;
  String? itemCode;
  String? priceListRate;
  String? validFrom;
  String? validUpto;
  String? vehicleColor;
  String? vehicleModel;
  String? vehicleEngineType;
  String? vehicleType;
  String? vehicleYear;
  String? vehicleHorsePower;
  String? vehicleMake;
  String? licensePlate;
  String? initialMileage;

  Item(
      {this.name,
      this.image,
      this.itemCode,
      this.priceListRate,
      this.validFrom,
      this.validUpto,
      this.vehicleColor,
      this.vehicleModel,
      this.vehicleEngineType,
      this.vehicleType,
      this.vehicleYear,
      this.vehicleHorsePower,
      this.vehicleMake,
      this.licensePlate,
      this.initialMileage});

  Item.fromJson(Map<String, dynamic> json) {
    // print('sssssssssss${json['vehicleColor']}');
    name = json['name'];
    image = json['image'];
    itemCode = json['item_code'];
    priceListRate = json['priceListRate'];
    validFrom = json['valid_from'];
    validUpto = json['valid_upto'];
    vehicleColor = json['vehicleColor'];
    vehicleModel = json['vehicleModel'];
    vehicleEngineType = json['vehicleEngineType'];
    vehicleType = json['vehicleType'];
    vehicleYear = json['vehicleYear'];
    vehicleHorsePower = json['vehicleHorsePower'];
    vehicleMake = json['vehicleMake'];
    licensePlate = json['licensePlate'];
    initialMileage = json['initialMileage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['item_code'] = itemCode;
    data['price_list_rate'] = priceListRate;
    data['valid_from'] = validFrom;
    data['valid_upto'] = validUpto;
    data['vehicle_color'] = vehicleColor;
    data['vehicle_model'] = vehicleModel;
    data['vehicle_engine_type'] = vehicleEngineType;
    data['vehicle_type'] = vehicleType;
    data['vehicle_year'] = vehicleYear;
    data['vehicle_horse_power'] = vehicleHorsePower;
    data['vehicle_make'] = vehicleMake;
    data['license_plate'] = licensePlate;
    data['initial_mileage'] = initialMileage;
    return data;
  }
}

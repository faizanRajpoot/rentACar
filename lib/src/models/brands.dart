import 'dart:core';

List<Brand> brandListFromJson(dynamic str) =>
    List<Brand>.from(str.map((x) => Brand.fromJson(x)));

class Brand {
  String? name;
  String? image;

  Brand({
    this.name,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"],
        image: json["image"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}


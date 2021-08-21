// To parse this JSON data, do
//
//     final healthProduct = healthProductFromJson(jsonString);

import 'dart:convert';

class HealthProduct {
  HealthProduct({
    this.category,
    this.available,
    this.id,
    this.name,
    this.packSizeLabel,
    this.price,
    this.skuId,
    this.packSize,
  });

  List<String> category;
  bool available;
  String id;
  String name;
  String packSizeLabel;
  int price;
  int skuId;
  int packSize;

  factory HealthProduct.fromRawJson(String str) =>
      HealthProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HealthProduct.fromJson(Map<String, dynamic> json) => HealthProduct(
        category: List<String>.from(json["category"].map((x) => x)),
        available: json["available"],
        id: json["_id"],
        name: json["name"],
        packSizeLabel: json["packSizeLabel"],
        price: json["price"],
        skuId: json["skuId"],
        packSize: json["packSize"],
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x)),
        "available": available,
        "_id": id,
        "name": name,
        "packSizeLabel": packSizeLabel,
        "price": price,
        "skuId": skuId,
        "packSize": packSize,
      };
}

import 'package:basic_ecommerce_app_with_getx/utils/extenstions.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name;
  String? price;
  String? image;
  String? size;
  String? description;
  Color color = Colors.black;
  ProductModel({
    this.name,
    this.price,
    this.image,
    required this.color,
    this.size,
    this.description,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    price = json['price'];
    image = json['image'];
    color = HexColor.fromHex(json['color']); // Use json instead of Map
    size = json['size'];
    description = json['description'];
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'color': color,
      'size': size,
      'description': description,
    };
  }
}

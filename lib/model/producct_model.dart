import 'package:flutter/material.dart';

class ProductModel {
  String? name;
  String? price;
  String? image;
  String? color;
  String? size;
  String? description;

  ProductModel({
    this.name,
    this.price,
    this.image,
    this.color,
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
    color = json['color'];
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

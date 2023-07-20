import 'package:basic_ecommerce_app_with_getx/core/services/database/card_databse_helper.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/utils/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CardProductModel {
  String? name;
  String? price;
  String? image;

  int quantity = 1;
  CardProductModel({
    this.name,
    this.price,
    this.image,
    this.quantity = 1,
  });

  CardProductModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

  insert(CardProductModel model) async {
    var dbclient = await CardDataBaseHelper.db.database;
    await dbclient!.insert(tabelCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}





/*     var dbclient = await Database;
    await dbclient.insert(tabelCartProduct, model.toJson(),
        ConflictAlgorithm: ConflictAlgorithm.replace); */

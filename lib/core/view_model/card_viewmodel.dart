import 'package:basic_ecommerce_app_with_getx/model/card_product_model.dart';
import 'package:flutter/material.dart';
import 'package:basic_ecommerce_app_with_getx/core/services/database/card_databse_helper.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/utils/extenstions.dart';

import 'package:get/get.dart';

class CardViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  CardViewModel() {
    getAllProducts();
  }

  Future<void> addProduct(CardProductModel cardproductmodel) async {
    var dbhlper = await CardDataBaseHelper.db.database;
    _loading.value = true;
    await dbhlper!.insert('card', cardproductmodel.toJson());
    print("*******add********");
    _cardproductmodel.add(cardproductmodel); 
    print(_cardproductmodel.length);
    print("********add*******");
    _loading.value = false;
  }

  List<CardProductModel> _cardproductmodel = [];
  List<CardProductModel> get cardproductmodel => _cardproductmodel;

  getAllProducts() async {
    _loading.value = true;

    var dbhlper = await CardDataBaseHelper.db;
    _cardproductmodel = await dbhlper.getAllPruoducts();
    print("*******get********");
    print(_cardproductmodel.length);
    print("********get*******");

    _loading.value = false;
    update();
  }

/* 
addProduct(CardProductModel cardproductmodel) async {
    var dbhlper = await CardDataBaseHelper.db.database;
    _loading.value = true;
    await dbhlper!.insert(cardproductmodel);
    _loading.value = false;

} */
}

import 'package:basic_ecommerce_app_with_getx/core/services/home_service.dart';
import 'package:basic_ecommerce_app_with_getx/model/category_model.dart';
import 'package:basic_ecommerce_app_with_getx/model/producct_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loding => _loding;

  ValueNotifier<bool> _loding = ValueNotifier(false);

  List<CategoryModel> get categorymodel => _categorymodel;

  List<CategoryModel> _categorymodel = [];

  List<ProductModel> get productsmodel => _productsmodel;

  List<ProductModel> _productsmodel = [];

  HomeViewModel() {
    getCategories();
    getbestsellingproducts();
  }

  void getCategories() async {
    _loding.value = true;
    HomeServicce().getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categorymodel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loding.value = false;
      }
      update();
    }).catchError((error) {
      print("Error fetching categories: $error");
    });
  }

  getbestsellingproducts() async {
    _loding.value = true;
    HomeServicce().getbestsellingproducts().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _productsmodel.add(ProductModel.fromJson(
                  value[i].data() as Map<dynamic, dynamic>)),
              _loding.value = false,
             // print(productsmodel.length),
            },
          update(),
        });

    _loding.value = false;
  }
}

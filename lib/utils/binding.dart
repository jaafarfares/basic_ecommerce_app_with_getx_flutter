import 'package:basic_ecommerce_app_with_getx/core/view_model/auth_viewmodel.dart';
import 'package:basic_ecommerce_app_with_getx/core/view_model/card_viewmodel.dart';
import 'package:basic_ecommerce_app_with_getx/core/view_model/controll_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/core/view_model/home_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/model/card_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CardViewModel());
  }
}

import 'package:basic_ecommerce_app_with_getx/core/view_model/controll_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/core/view_model/home_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/view/auth/login_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/card_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_sized_box.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:basic_ecommerce_app_with_getx/view/home_page.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('card'),),);
  }
}

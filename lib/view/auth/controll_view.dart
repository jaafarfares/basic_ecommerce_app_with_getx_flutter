import 'package:basic_ecommerce_app_with_getx/core/view_model/auth_viewmodel.dart';
import 'package:basic_ecommerce_app_with_getx/core/view_model/controll_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/view/card_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/home_page.dart';
import 'package:basic_ecommerce_app_with_getx/view/auth/login_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentscreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Home'),
            ),
            label: ' ',
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.home,
                color: primarycolor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Card'),
            ),
            label: '  ',
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.shopping_cart,
                color: primarycolor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Profile'),
            ),
            label: ' ',
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.person_outline,
                color: primarycolor,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorvalue,
        onTap: (index) {
          controller.changeselectedvalue(index);
        },
        elevation: 0,
      ),
    );
  }
}

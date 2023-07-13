import 'package:basic_ecommerce_app_with_getx/view/card_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/home_page.dart';
import 'package:basic_ecommerce_app_with_getx/view/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorvalue = 0;

  get navigatorvalue => _navigatorvalue;

  Widget _currentscreen = HomePage();

  get currentscreen => _currentscreen;

  void changeselectedvalue(int selectedvaue) {
    _navigatorvalue = selectedvaue;
    switch (selectedvaue) {
      case 0:
        {
          _currentscreen = HomePage();
          break;
        }
      case 1:
        {
          _currentscreen = CardScreen();
          break;
        }
      case 2:
        {
          _currentscreen = ProfileScreen();
          break;
        }
    }
    update();
  }
}

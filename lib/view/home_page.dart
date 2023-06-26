import 'package:basic_ecommerce_app_with_getx/view/auth/login_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: GestureDetector(
          onTap: () {
            _auth.signOut();
           Get.offAll(() => (LoginScreen()));
          },
          child: const CustomText(
            text: 'home pgae',
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

import 'package:basic_ecommerce_app_with_getx/core/view_model/controll_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/core/view_model/home_view_model.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/view/auth/login_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/card_screen.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_flat_button.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_sized_box.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:basic_ecommerce_app_with_getx/view/home_page.dart';

class CardScreen extends StatelessWidget {
  List<String> names = <String>[
    'data',
    'data 2  ',
    'data',
    'data',
    'data',
  ];
  List<String> images = <String>[
    'assets/women.jpeg',
    'assets/nikeee.jpeg',
    'assets/women.jpeg',
    'assets/women.jpeg',
    'assets/women.jpeg',
  ];
  List<int> prices = <int>[
    100,
    200,
    300,
    400,
    500,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          height: 140,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                fontSize: 22,
                                text: names[index],
                              ),
                              const CustomSizedBox(height: 7),
                              CustomText(
                                color: primarycolor,
                                text: '\$  ${prices[index].toString()} ',
                              ),
                              const CustomSizedBox(height: 7),
                              Container(
                                width: 90,
                                color: greycolor.shade200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                                  children: [
                                    Icon(Icons.add),
                                    CustomSizedBox(width: 10),
                                    CustomText(
                                      text: '1',
                                    ),
                                    CustomSizedBox(width: 10),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: Icon(Icons.minimize)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: names.length,
                separatorBuilder: (BuildContext context, int index) {
                  return CustomSizedBox();
                },
              ),
            ),
          ),
          CustomSizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'TOTAL',
                      color: greycolor.shade500,
                      fontSize: 22,
                    ),
                    CustomSizedBox(),
                    CustomText(
                      text: '\$3050',
                      color: primarycolor,
                      fontSize: 22,
                    ),
                  ],
                ),
                Container(
                  //padding: EdgeInsets.all(0),
                  height: 60,
                  width: 150,
                  child: CustomButton(
                    onPressed: () {},
                    label: 'CHECKOUT',
                    fontSize: 22,
                    backgroundColor: primarycolor.shade400,
                    color: whitecolor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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

class HomePage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final List<String> items = <String>[
    'men',
    'women',
    'boy',
    'girl',
    'kid',
    'kids',
    'men',
    'women',
    'boy',
    'girl',
    'kid',
    'kids',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loding.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      _searchtextfromfeild(),
                      const CustomSizedBox(height: 25),
                      const CustomText(
                        text: categoriestext,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      const CustomSizedBox(),
                      _catergorycontainer(),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      const CustomSizedBox(),
                      const CustomSizedBox(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: bestsellingtext,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          CustomText(
                            text: seealltext,
                          ),
                        ],
                      ),
                      _ListViwproduct(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  _searchtextfromfeild() {
    return Container(
      decoration: BoxDecoration(
          color: greyshadecolor, borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: blackcolor,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _catergorycontainer() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categorymodel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.network(
                        controller.categorymodel[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const CustomSizedBox(),
                CustomText(
                  text: controller.categorymodel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const CustomSizedBox(
            height: 0,
            width: 10,
          ),
        ),
      ),
    );
  }

  Widget _ListViwproduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 320,
        child: ListView.separated(
          //  shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.productsmodel.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * .45,
              child: Column(
                children: [
                  Container(
                    // height: 300,
                    //  height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 220,
                            width: MediaQuery.of(context).size.height,
                            child: Image.network(
                                controller.productsmodel[index].image!)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        CustomText(
                          text: controller.productsmodel[index].name!,
                          fontWeight: FontWeight.bold,
                          alignment: Alignment.bottomLeft,
                        ),
                        CustomSizedBox(height: 5),
                        CustomText(
                          text: controller.productsmodel[index].description!
                              .split(",")
                              .sublist(0, 2)
                              .join(),
                          color: greycolor,
                          alignment: Alignment.bottomLeft,
                          maxLines: 1,
                        ),
                        CustomSizedBox(),
                        CustomText(
                          text: '\$${controller.productsmodel[index].price!}\$',
                          color: primarycolor,
                          fontWeight: FontWeight.bold,
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const CustomSizedBox(
            height: 0,
            width: 10,
          ),
        ),
      ),
    );
  }
}

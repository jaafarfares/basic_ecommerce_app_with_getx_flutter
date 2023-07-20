import 'package:basic_ecommerce_app_with_getx/core/view_model/card_viewmodel.dart';
import 'package:basic_ecommerce_app_with_getx/model/card_product_model.dart';
import 'package:basic_ecommerce_app_with_getx/model/producct_model.dart';
import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_flat_button.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_sized_box.dart';
import 'package:basic_ecommerce_app_with_getx/view/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel model;

  DetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 330,
              child: Image.network(
                model.image!,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const CustomSizedBox(),
                        CustomText(
                          text: model.name!,
                          //fontWeight: FontWeight.bold,
                          // alignment: Alignment.center,
                          fontSize: 27,
                        ),
                        const CustomSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .45,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: greycolor)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CustomText(
                                    text: sizetext,
                                    alignment: Alignment.center,
                                  ),
                                  CustomText(
                                    text: model.size!,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: greycolor)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: colortext,
                                    alignment: Alignment.center,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: model.color,
                                        border: Border.all(color: greycolor)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const CustomSizedBox(),
                        const CustomText(
                          text: detailstext,
                          fontSize: 19,
                        ),
                        CustomText(
                          text: model.description!,
                          //fontWeight: FontWeight.bold,
                          // alignment: Alignment.center,
                          fontSize: 14,
                          maxLines: 9,
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: pricetext,
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: ' \$' + model.price!,
                        color: primarycolor,
                        fontSize: 18,
                      )
                    ],
                  ),
                  GetBuilder<CardViewModel>(
                    init: CardViewModel(),
                    builder: (controller) => Container(
                      padding: EdgeInsets.all(20),
                      width: 180,
                      height: 100,
                      child: CustomButton(
                        onPressed: () {
                          controller.addProduct(CardProductModel(quantity: 1, name: model.name, image: model.image, price: model.price));
                        },
                        label: addtocardtext,
                        backgroundColor: primarycolor.shade400,
                        color: whitecolor,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

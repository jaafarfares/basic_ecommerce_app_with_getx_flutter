import 'package:basic_ecommerce_app_with_getx/tools/constance.dart';
import 'package:basic_ecommerce_app_with_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFromFeild extends StatelessWidget {
  const CustomTextFromFeild(
      {
      this.text = '',
      this.hinttext = '',
      this.onSave,
      this.obscureText = false,
      this.maxLength = 24,
      this.validator});
  final String text;
  final bool obscureText;
  final String hinttext;
  final int maxLength;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: blackcolor,
          ),
          TextFormField(
            maxLength: maxLength,
            obscureText: obscureText,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: const TextStyle(color: greycolor),
                fillColor: whitecolor),
          ),
        ],
      ),
    );
  }
}

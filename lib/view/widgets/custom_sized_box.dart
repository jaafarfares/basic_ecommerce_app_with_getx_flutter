import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;

  const CustomSizedBox({Key? key, this.height = 15.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

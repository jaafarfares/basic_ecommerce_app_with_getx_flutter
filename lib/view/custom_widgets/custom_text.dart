import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    this.text = '',
    this.fontSize = 15,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.textOverflow = TextOverflow.ellipsis,
  });

  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        maxLines: maxLines,
        overflow: textOverflow,
      ),
    );
  }
}

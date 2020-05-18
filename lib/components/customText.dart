import 'package:flutter/material.dart';

class CustomText extends Text {
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final int maxLines;
  final TextDecoration textDecoration;

  CustomText(
      {this.textAlign,
        this.textColor,
        this.maxLines,
        this.textSize,
        this.textDecoration,
        this.textOverflow = TextOverflow.fade,
        this.fontWeight,
        @required this.text})
      : super(text,
      textAlign: textAlign,
      maxLines:maxLines,
      overflow:textOverflow,
      style: TextStyle(
          decoration: textDecoration,
          color: textColor, fontSize: textSize, fontWeight: fontWeight));
}

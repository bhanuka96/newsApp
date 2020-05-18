import 'package:flutter/material.dart';

class CustomSize{
  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  static double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;

  static double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
}
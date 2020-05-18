import 'package:flutter/material.dart';
import 'package:newsapp/constants/palette.dart';

import 'customText.dart';

class CustomNoDataFound extends Center {
  final String text;
  CustomNoDataFound({this.text = 'No News Found'})
      : super(
            child: CustomText(
          text: text,
          textColor: Palette.silverText5,
          fontWeight: FontWeight.bold,
        ));
}

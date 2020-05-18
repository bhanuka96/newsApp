import 'package:flutter/material.dart';

import 'palette.dart';
class CustomGradient {
  static const Gradient splashGradient = LinearGradient(
      colors: [
        Palette.gradientBegin,
        Palette.gradientEnd
      ],
      begin: Alignment.topCenter,//const FractionalOffset(0.0, 0.0),
      end:  Alignment.bottomCenter,//const FractionalOffset(1.0, 1.0),
     //stops: [1.0, 1.0],
     // tileMode: TileMode.clamp
  );

  static const Gradient buttonGradient = LinearGradient(
      colors: [
        Palette.gradientButton1,
        Palette.gradientButton2
      ],
      begin: const FractionalOffset(0.0, 0.5),
      end: const FractionalOffset(0.5, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const Gradient buttonSilverGradient = LinearGradient(
      colors: [
        Palette.silverText,
        Palette.silverText5
      ],
      begin: const FractionalOffset(0.0, 0.5),
      end: const FractionalOffset(0.5, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const Gradient plusGradient = LinearGradient(
      colors: [
        Palette.gradientColor1L,
        Palette.gradientColor2R
      ],
      begin: const FractionalOffset(0.0, 0.5),
      end: const FractionalOffset(0.5, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const Gradient appBarGradient = LinearGradient(
      colors: [
        Palette.plusGradient1L,
        Palette.plusGradient2R
      ],
      begin: FractionalOffset.bottomCenter,
      end: FractionalOffset.topCenter);

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'palette.dart';

class CustomTheme{
  static ThemeData themeData = ThemeData(
     // pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()}),
      primarySwatch: Palette.materialColor,

      //for ios
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor:Palette.materialColor,
      ),
      // for others(Android, Fuchsia)
      cursorColor:Palette.materialColor,
      primaryColor: Palette.primaryColor);
}
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/components/customText.dart';
import 'package:newsapp/constants/palette.dart';

import 'splashscreen.dart';

class Splash extends StatefulWidget {
  static const String route = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/dashboardPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      scaffoldKey: _scaffoldKey,
        title: CustomText(
          text: 'News App',
          textColor: Palette.defaultColor4,
          fontWeight: FontWeight.bold,
          textSize: 26,
        ),
        backgroundColor: Palette.white,
        photoSize: 50.0);
  }
}

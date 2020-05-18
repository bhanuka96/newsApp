import 'dart:core';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final Text title;
  final Color backgroundColor;
  final double photoSize;
  final GlobalKey<ScaffoldState> scaffoldKey;

  SplashScreen(
      {this.photoSize,
        this.scaffoldKey,
      this.title = const Text(''),
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset('assets/appLogo.png',
                        width: 100, height: 100),
                    radius: photoSize,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

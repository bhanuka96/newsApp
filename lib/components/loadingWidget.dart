import 'package:flutter/material.dart';
import 'package:newsapp/constants/palette.dart';

class LoadingWidget extends Stack{
  LoadingWidget():super(
      children: <Widget>[
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Palette.defaultColor.withOpacity(.2),
                        offset: Offset(0, 5),
                        blurRadius: 5)
                  ]),
              child: Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Palette.defaultColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
  );
}
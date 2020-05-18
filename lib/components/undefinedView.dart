import 'package:flutter/material.dart';

import 'customText.dart';

class UndefinedView extends StatelessWidget {
  final String routeName;

  const UndefinedView({Key key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
            text:
            'App Issue please contact Development Team'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/router.dart';
import 'package:provider/provider.dart';

import 'constants/customTheme.dart';
import 'di/global_providers.dart';

void main() {
  runApp(MultiProvider(
    providers: globalProviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.themeData,
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

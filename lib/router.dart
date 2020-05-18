import 'package:flutter/material.dart';
import 'package:newsapp/models/arguments.dart';
import 'package:newsapp/screens/detailsPage/detailsPage.dart';
import 'package:newsapp/screens/splash/splash.dart';

import 'components/undefinedView.dart';
import 'screens/dashboard/dashboardPage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Arguments arguments = settings.arguments;

    switch (settings.name) {
      case Splash.route:
        return MaterialPageRoute(builder: (_) => Splash());
      case DetailsPage.route:
        return MaterialPageRoute(builder: (_) => DetailsPage());
      case DashboardPage.route:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
              routeName: settings.name,
            ));
    }
  }
}

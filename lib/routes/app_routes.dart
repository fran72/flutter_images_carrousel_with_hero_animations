import 'package:flutter/material.dart';
import 'package:flutter_app_cap7/models/menu_option.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home'; //= 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        name: 'Home Screen',
        screen: const HomeScreen(),
        icon: Icons.vaccines),
    MenuOption(
        route: 'details',
        name: 'Details Screen',
        screen: const DetailsScreen(),
        icon: Icons.cable),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> approutes = {};

    // approutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      approutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return approutes;
  }
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listView1': (BuildContext context) => const Listview1Screen(),
  //   'listView2': (BuildContext context) => const Listview2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }
}

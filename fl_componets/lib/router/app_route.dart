import 'package:fl_componets/models/menu_option.dart';
import 'package:fl_componets/screens/alert_screen.dart';
import 'package:fl_componets/screens/card_screen.dart';
import 'package:fl_componets/screens/homeScreen.dart';
import 'package:fl_componets/screens/listview_1_screen.dart';
import 'package:fl_componets/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(
    //     route: 'home',
    //     name: 'Home Screen',
    //     screen: const HomeScreen(),
    //     icon: Icons.adb),
    MenuOption(
        route: 'listView1',
        name: 'List View 1',
        screen: const Listview1Screen(),
        icon: Icons.library_add),
    MenuOption(
        route: 'alert',
        name: 'Alertas',
        screen: const AlertScreen(),
        icon: Icons.add_alert_rounded),
    MenuOption(
        route: 'card',
        name: 'Tarjetas',
        screen: const CardScreen(),
        icon: Icons.card_travel),
    MenuOption(
        route: 'avatar',
        name: 'Circle Avatar',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: 'animated',
        name: 'Animated Screen',
        screen: const AnimatedScreen(),
        icon: Icons.play_arrow),
    MenuOption(
        route: 'input',
        name: 'Text Inputs',
        screen: const InputsScreen(),
        icon: Icons.input),
    MenuOption(
        route: 'slider',
        name: 'Slider and Checks',
        screen: const SliderScreen(),
        icon: Icons.check_box),
    MenuOption(
        route: 'LisViewBuilder',
        name: 'InfinieScroll & Pull to refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.list_alt_sharp)
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listView1': (BuildContext context) => const Listview1Screen(),
  //   'card': (BuildContext context) => const CardScreen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  // };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}

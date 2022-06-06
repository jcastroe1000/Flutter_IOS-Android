import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled), label: 'titulo 1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined), label: 'Titulo 2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_sharp), label: 'Titulo 3'),
        ]);
  }
}

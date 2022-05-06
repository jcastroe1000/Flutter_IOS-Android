import 'package:flutter/material.dart';
import 'package:fl_componets/screens/card_screen.dart';
import 'package:fl_componets/screens/alert_screen.dart';
import 'package:fl_componets/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: const Listview1Screen(),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomeScreen(),
        'listView1': (BuildContext context) => const Listview1Screen(),
        'card': (BuildContext context) => const CardScreen(),
        'Alert': (BuildContext context) => const AlertScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const AlertScreen());
      },
    );
  }
}

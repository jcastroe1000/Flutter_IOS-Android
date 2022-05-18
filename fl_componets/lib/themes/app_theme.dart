import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.purple;
  static final ThemeData lighTheme = ThemeData.light().copyWith(
      primaryColor: Colors.purple,
      appBarTheme: const AppBarTheme(color: primary, elevation: 10),
      //TextButtonTheme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 4),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
              shape: const StadiumBorder(),
              elevation: 0)));
  //FloartinActionBottom

}

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.purple;
  static final ThemeData lighTheme = ThemeData.light().copyWith(
      primaryColor: Colors.purple,
      appBarTheme: const AppBarTheme(color: primary, elevation: 10));
}

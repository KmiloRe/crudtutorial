import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade600,
    tertiary: Colors.lightBlue.shade900,
    tertiaryContainer: const Color(0xFFC40233),
    secondaryContainer: const Color(0xFF1B1B1B),
  ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Open Sans',
        bodyColor: Colors.grey[800],
        displayColor: Colors.black,
      ),
);

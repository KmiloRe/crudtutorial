import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
    tertiary: Colors.lightBlue.shade100,
    primaryContainer: const Color(0xFFC40233),
    secondaryContainer: const Color(0xFF1B1B1B),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        //todo change font family
        fontFamily: 'Open Sans',
        bodyColor: Colors.grey[300],
        displayColor: Colors.white,
      ),
);

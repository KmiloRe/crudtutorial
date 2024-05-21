import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
    tertiary: Colors.lightBlue.shade100,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        //todo change font family
        fontFamily: 'Open Sans',
        bodyColor: Colors.grey[300],
        displayColor: Colors.white,
      ),
);

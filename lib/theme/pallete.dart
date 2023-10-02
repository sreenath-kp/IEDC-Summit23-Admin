import 'package:flutter/material.dart';

class Pallete {
  // Colors
  static const backgroundColor = Color(0xFF1F202B);
  static const greyColor = Color.fromRGBO(26, 39, 45, 1);
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: backgroundColor,
    ),
  );
}

import 'package:flutter/material.dart';

class MainAppBarTheme {
  MainAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 16),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 16),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
      toolbarHeight: kToolbarHeight,
      titleSpacing: 0);

  static const darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 16),
      actionsIconTheme: IconThemeData(color: Colors.white, size: 16),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
      toolbarHeight: kToolbarHeight,
      titleSpacing: 0);
}

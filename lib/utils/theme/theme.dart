import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/appbar_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/chip_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/text_field_theme.dart';
import 'package:proj_hiraya/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    chipTheme: HChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: HAppBarTheme.lightAppBarTheme,
    checkboxTheme: HCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: HBottomSheetTheme.lightBottomSheetTheme,
    textTheme: HTextTheme.lightTextTheme,
    elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: HOutlinedButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: HTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    chipTheme: HChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: HAppBarTheme.darkAppBarTheme,
    checkboxTheme: HCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: HBottomSheetTheme.darkBottomSheetTheme,
    textTheme: HTextTheme.darkTextTheme,
    elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: HOutlinedButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: HTextFormFieldTheme.darkInputDecorationTheme,
  );
}

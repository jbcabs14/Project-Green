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
    chipTheme: MainChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: MainAppBarTheme.lightAppBarTheme,
    checkboxTheme: MainCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: MainBottomSheetTheme.lightBottomSheetTheme,
    textTheme: MainTextTheme.lightTextTheme,
    elevatedButtonTheme: MainElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MainOutlinedButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: MainTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    chipTheme: MainChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: MainAppBarTheme.darkAppBarTheme,
    checkboxTheme: MainCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: MainBottomSheetTheme.darkBottomSheetTheme,
    textTheme: MainTextTheme.darkTextTheme,
    elevatedButtonTheme: MainElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MainOutlinedButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: MainTextFormFieldTheme.darkInputDecorationTheme,
  );
}

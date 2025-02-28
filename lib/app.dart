import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/theme/theme.dart';

// Use this class to setup themes, initial bindings, any animations and much more....
class Hiraya extends StatelessWidget {
  const Hiraya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/bindings/general_bindings.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/theme/theme.dart';

// Use this class to setup themes, initial bindings, any animations and much more....
class Hiraya extends StatelessWidget {
  const Hiraya({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MainAppTheme.lightTheme,
      darkTheme: MainAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: MainColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

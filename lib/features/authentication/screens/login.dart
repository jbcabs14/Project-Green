import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return const Scaffold(
      body: SingleChildScrollView(
        child: Text('Login Screen'),
      ),
    );
  }
}

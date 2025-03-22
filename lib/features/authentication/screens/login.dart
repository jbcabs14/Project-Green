import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/features/authentication/screens/sign-up.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// Image/Color Background
          Container(
            width: HelperFunctions.screenSizeWidth(),
            height: HelperFunctions.screenSizeHeight() * 0.6,
            color: dark ? Colors.black : Colors.white,
          ),

          /// Email Field
          TextField(
            decoration: InputDecoration(
              hintText: 'Mobile Number',
            ),
          ),

          /// Password Field
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),

          /// Login Button
          ElevatedButton(
            onPressed: () => Get.to(() => SignUpScreen()),
            child: const Text("Login"),
          ),

          /// Google Button
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                side: WidgetStateProperty.all(
                  BorderSide(color: Colors.transparent, width: 2),
                )),
            onPressed: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage(MainImages.googleLogo),
            ),
          ),

          /// Forgot Password
          TextButton(
            onPressed: () {},
            child: const Text('Forgot Password?'),
          ),

          /// Register Button
          TextButton(
            onPressed: () {},
            child: const Text('Register'),
          ),
        ],
      )),
    );
  }
}

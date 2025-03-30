import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/features/authentication/screens/login/widgets/login_header.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// Image/Color Background
          Container(
            width: HelperFunctions.screenSizeWidth(),
            height: HelperFunctions.screenSizeHeight() * 0.6,
          ),

          /// Mobile Number Field
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

          /// Confirm Password Field
          TextField(
            decoration: InputDecoration(
              hintText: 'Confirm Password',
            ),
          ),

          /// Google Sign-up Button
          ElevatedButton(
            onPressed: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage(MainImages.googleLogo),
            ),
          ),
        ],
      )),
    );
  }
}

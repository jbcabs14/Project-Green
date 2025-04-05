import 'package:flutter/material.dart';
import 'package:proj_hiraya/common/styles/spacing_styles.dart';
import 'package:proj_hiraya/common/widgets/authentication/social_icons.dart';
import 'package:proj_hiraya/common/widgets/dividers/divider.dart';
import 'package:proj_hiraya/features/authentication/screens/login/widgets/login_form.dart';
import 'package:proj_hiraya/features/authentication/screens/login/widgets/login_header.dart';
import 'package:proj_hiraya/features/authentication/screens/login/widgets/signup_label.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';
import 'package:proj_hiraya/common/widgets/authentication/label.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
              padding: MainSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  // Logo, Title, Subtitle
                  MainLoginHeader(),

                  // Form
                  MainLoginForm(),

                  // Divider
                  MainDivider(dividerText: MainTexts.optionalAltLoginText),

                  SizedBox(height: MainSizes.sectionGap),

                  // Social Logins
                  SocialIcons(),

                  SizedBox(height: MainSizes.sectionGap),

                  // Sign Up
                  SignUpLabel(),

                  SizedBox(height: MainSizes.sectionGap / 2),

                  // Copyright Text
                  MainLabel(labelText: MainTexts.copyRight)
                ],
              ))),
    );
  }
}

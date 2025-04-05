import 'package:flutter/material.dart';
import 'package:proj_hiraya/common/widgets/authentication/social_icons.dart';
import 'package:proj_hiraya/common/widgets/dividers/divider.dart';
import 'package:proj_hiraya/features/authentication/screens/signup/widgets/login_label.dart';
import 'package:proj_hiraya/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(MainSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(MainTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: MainSizes.sectionGap),

              // Form
              const MainSignupForm(),

              const SizedBox(height: MainSizes.sectionGap),

              // Divider
              const MainDivider(dividerText: MainTexts.optionalAltSignupText),

              const SizedBox(height: MainSizes.sectionGap / 2),

              // Footer
              const SocialIcons(),

              const SizedBox(height: MainSizes.sectionGap / 2),

              // Sign In Label
              const LoginLabel()
            ],
          ),
        ),
      ),
    );
  }
}

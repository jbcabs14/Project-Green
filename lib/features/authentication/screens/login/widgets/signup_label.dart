import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/common/widgets/authentication/label.dart';
import 'package:proj_hiraya/features/authentication/screens/signup/signup.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class SignUpLabel extends StatelessWidget {
  const SignUpLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLabel(
        onTap: () => Get.to(() => const SignUpScreen()),
        labelText: "Don't have an account?",
        highlightText: MainTexts.signUp);
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/common/widgets/authentication/label.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class LoginLabel extends StatelessWidget {
  const LoginLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLabel(
        onTap: () => Get.back(),
        labelText: "Already have an account?",
        highlightText: MainTexts.signIn);
  }
}

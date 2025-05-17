import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/features/authentication/controllers/signup_controller.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.toggle()))),
        const SizedBox(width: MainSizes.itemGap),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: 'I agree to the ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: MainColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: MainColors.primary),
          ),
          TextSpan(
            text: ' and ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: 'Terms of Service',
            style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: MainColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: MainColors.primary),
          ),
        ])),
      ],
    );
  }
}

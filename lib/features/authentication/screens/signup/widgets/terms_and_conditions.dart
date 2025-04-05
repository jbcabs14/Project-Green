import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: false, onChanged: (value) => {})),
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

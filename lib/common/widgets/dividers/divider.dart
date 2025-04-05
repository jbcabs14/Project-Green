import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({
    super.key,
    this.thickness = 0.8,
    this.textSpacing = 10.0,
    this.lineLength = 20.0,
    required this.dividerText,
  });

  final String dividerText;
  final double thickness;
  final double textSpacing;
  final double lineLength;

  @override
  Widget build(BuildContext context) {
    final bool dark = HelperFunctions.isDarkMode(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
          child: Divider(
              color: dark ? MainColors.darkGrey : MainColors.grey,
              thickness: thickness,
              indent: 100 - lineLength,
              endIndent: textSpacing)),
      Text(dividerText.capitalize!,
          style: Theme.of(context).textTheme.labelMedium),
      Flexible(
          child: Divider(
              color: dark ? MainColors.darkGrey : MainColors.grey,
              thickness: thickness,
              indent: textSpacing,
              endIndent: 100 - lineLength)),
    ]);
  }
}

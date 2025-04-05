import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';

class MainLabel extends StatelessWidget {
  const MainLabel(
      {super.key,
      this.highlightText = "",
      this.onTap,
      required this.labelText});

  final String labelText;
  final String highlightText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelText, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(width: 2),
        Material(
          color:
              Colors.transparent, // Ensures only the ripple effect is visible
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20), // Circular ripple effect
            child: Padding(
              padding: const EdgeInsets.all(4), // Adds tappable area
              child: Text(
                highlightText,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.apply(color: MainColors.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

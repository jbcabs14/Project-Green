import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainProfileSettingsTile extends StatelessWidget {
  const MainProfileSettingsTile(
      {super.key,
      this.icon = Iconsax.arrow_right_34,
      required this.onPressed,
      required this.leading,
      required this.value});

  final IconData icon;
  final VoidCallback onPressed;
  final Widget leading, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: MainSizes.itemGap / 1.5),
            child: Row(
              children: [
                Expanded(flex: 1, child: leading),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: MainSizes.sm),
                      child: value,
                    )),
                Expanded(child: Icon(icon, size: 18))
              ],
            )));
  }
}

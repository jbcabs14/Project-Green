import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/device/device_utility.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.systemOverlayStyle,
      this.elevation});

  final Widget? title;
  final bool showBackArrow;
  final double? elevation;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MainSizes.md),
      child: AppBar(
        systemOverlayStyle: systemOverlayStyle,
        automaticallyImplyLeading: false,
        elevation: elevation,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left,
                    color: dark ? MainColors.white : MainColors.black))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MainDeviceUtils.getAppBarHeight());
}

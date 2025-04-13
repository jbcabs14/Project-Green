import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/device/device_utility.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class MainTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MainTabBar({super.key, required this.tabs, this.isScrollable = false});

  final List<Widget> tabs;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? MainColors.black : MainColors.light,
      elevation: 1,
      child: TabBar(
          isScrollable: isScrollable,
          unselectedLabelColor: MainColors.darkGrey,
          indicatorColor: MainColors.primary,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: MainColors.primary,
          dividerColor: Colors.transparent,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MainDeviceUtils.getAppBarHeight());
}

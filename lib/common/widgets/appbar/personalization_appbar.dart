import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/features/personalization/screens/user_account.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/device/device_utility.dart';

class PersonalizationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PersonalizationAppBar({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: Text(username),
      showBackArrow: true,
      actions: [
        TextButton(
            onPressed: () => Get.to(() => const MainUserAccountPage()),
            child: const Text('Edit profile',
                style: TextStyle(color: MainColors.primary))),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MainDeviceUtils.getAppBarHeight());
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/common/widgets/tiles/bottom_up_drawer_tile.dart';
import 'package:proj_hiraya/data/repositories/authentication_repo.dart';
import 'package:proj_hiraya/features/authentication/controllers/login_controller.dart';
import 'package:proj_hiraya/features/authentication/screens/login/login.dart';

class MainBottomDrawer extends StatelessWidget {
  const MainBottomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MainDrawerTile(
            icon: Iconsax.user,
            title: 'Profile',
            onTap: () {
              Navigator.pop(context);
            }),
        MainDrawerTile(
            icon: Iconsax.setting,
            title: 'Settings',
            onTap: () {
              Navigator.pop(context);
            }),
        MainDrawerTile(
            icon: Iconsax.logout,
            title: 'Logout',
            onTap: () {
              loginController.logout();
              Navigator.pop(context);
              Get.offAll(() => const LoginScreen());
            }),
      ],
    );
  }
}

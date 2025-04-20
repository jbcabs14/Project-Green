import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/common/widgets/drawers/bottom_drawer.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/features/notification/notification.dart';
import 'package:proj_hiraya/features/search/search_page.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';

class MainMenuAppbar extends StatelessWidget {
  const MainMenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: GestureDetector(
          onTap: () => MainLoaders.successSnackbar(title: 'Hello'),
          child: Image.asset(MainImages.lightAppLogoSm, height: 30)),
      actions: [
        IconButton(
          icon: const Icon(Iconsax.search_normal),
          onPressed: () => Get.to(() => const SearchPage()),
        ),
        IconButton(
          icon: const Icon(Iconsax.notification),
          onPressed: () => Get.to(() => const NotificationPage()),
        ),
        IconButton(
          icon: const Icon(Iconsax.user),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return const MainBottomDrawer();
                });
          },
        ),
      ],
    );
  }
}

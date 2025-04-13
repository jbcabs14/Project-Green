import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/common/widgets/custom_shapes/circular_image.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/common/widgets/texts/section_heading.dart';
import 'package:proj_hiraya/common/widgets/tiles/profile_settings_tile.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainUserAccountPage extends StatelessWidget {
  const MainUserAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: const Text('Edit profile'),
        showBackArrow: true,
        actions: [
          TextButton(
              onPressed: () {
                // Save changes logic here

                MainLoaders.successSnackbar(
                    title: 'Profile updated!',
                    message: 'Your profile has been successfully updated.');
              },
              child: const Text('Save',
                  style: TextStyle(color: MainColors.primary))),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: MainSizes.defaultSpace, horizontal: MainSizes.sm),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: MainSizes.xs),
              child: MainSectionHeading(
                  title: "Information Settings", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const MainCircularImage(
                image: MainImages.avatarIcon,
                width: 30,
                height: 30,
                padding: EdgeInsets.zero,
                borderRadius: 30,
              ),
              value: Text(
                "Change profile picture",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.user),
              ),
              value: Text(
                "John Benedict Cabintoy",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.home),
              ),
              value: Text(
                "Brgy. Kananga, Ormoc City",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.flag),
              ),
              value: Text(
                "Philippines",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.man),
              ),
              value: Text(
                "Male",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.cake),
              ),
              value: Text(
                "10-04-2000",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.info_circle),
              ),
              value: Text(
                "About me is Lorem Ipsum dolor sit amet, consectetur adipiscing elit.",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: MainSizes.sectionGap,
            ),
            const Padding(
              padding: EdgeInsets.only(left: MainSizes.xs),
              child: MainSectionHeading(
                  title: "Account Settings", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.direct_right),
              ),
              value: Text(
                "@benedictcabintoy",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.direct),
              ),
              value: Text(
                "jbcabintoy14@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.password_check),
              ),
              value: Text(
                "*********",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      )),
    );
  }
}

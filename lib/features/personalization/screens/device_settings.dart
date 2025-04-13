import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/common/widgets/texts/section_heading.dart';
import 'package:proj_hiraya/common/widgets/tiles/profile_settings_tile.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainDeviceSettingsPage extends StatelessWidget {
  const MainDeviceSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: Text('Settings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: MainSizes.defaultSpace, horizontal: MainSizes.sm),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: MainSizes.xs),
              child:
                  MainSectionHeading(title: "Display", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.moon),
              ),
              value: Text(
                "Dark mode",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: MainSizes.sectionGap,
            ),
            const Padding(
              padding: EdgeInsets.only(left: MainSizes.xs),
              child:
                  MainSectionHeading(title: "Content", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.danger),
              ),
              value: Text(
                "Hazardous events",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.forbidden),
              ),
              value: Text(
                "Blocked titles",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.forbidden_2),
              ),
              value: Text(
                "Blocked users",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: MainSizes.sectionGap,
            ),
            const Padding(
              padding: EdgeInsets.only(left: MainSizes.xs),
              child:
                  MainSectionHeading(title: "Account", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.user),
              ),
              value: Text(
                "Edit profile",
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
                "Change password",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.notification),
              ),
              value: Text(
                "Push notifications",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.lock_1),
              ),
              value: Text(
                "Privacy settings",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.logout),
              ),
              value: Text(
                "Log out",
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
                  title: "Advanced", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.language_square),
              ),
              value: Text(
                "Device language",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.bag),
              ),
              value: Text(
                "Clear cache",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.archive_tick),
              ),
              value: Text(
                "Save event on upvote",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: MainSizes.sectionGap,
            ),
            const Padding(
              padding: EdgeInsets.only(left: MainSizes.xs),
              child:
                  MainSectionHeading(title: "About", showActionButton: false),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.message_question),
              ),
              value: Text(
                "Ask a question",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.heart),
              ),
              value: Text(
                "Rate us",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.like_tag),
              ),
              value: Text(
                "Like us on Facebook",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.link_2),
              ),
              value: Text(
                "Share Hiraya",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: const SizedBox(
                height: 30,
                child: Icon(Iconsax.copyright),
              ),
              value: Text(
                "Copyright",
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
                "Privacy policy",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            MainProfileSettingsTile(
              onPressed: () {},
              leading: SizedBox(
                height: 30,
                child: Image.asset(MainImages.treeLogoBw),
              ),
              value: Text(
                "App version",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: MainSizes.sectionGap,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: MainColors.error,
                      side: const BorderSide(width: 0)),
                  child: Text('Delete Account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: MainColors.white))),
            ),
          ],
        ),
      )),
    );
  }
}

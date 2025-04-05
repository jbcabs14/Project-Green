import 'package:flutter/material.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';
import 'package:proj_hiraya/common/widgets/appbar/main_menu_appbar.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: LiquidPullRefresh(
        height: 100.0,
        backgroundColor: dark ? MainColors.black : const Color(0xFFFDFCE8),
        showChildOpacityTransition: false,
        color: MainColors.primary,
        animSpeedFactor: 3.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MainSizes.sm),
                  child: Column(
                    children: [
                      // Header
                      MainMenuAppbar(),
                    ],
                  ),
                ),
              ],
            ),

            // Divider
            const Divider(
              color: MainColors.grey,
              height: 1,
              thickness: 1,
            ),

            // Main Content
            Column(
              // Add 20 cards
              children: List.generate(
                20,
                (index) => Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: MainSizes.xs,
                  ),
                  elevation: 0,
                  color: MainColors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  child: ListTile(
                    title: Text('Post $index'),
                    subtitle: Text('Event $index'),
                    leading: const Icon(Icons.star),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

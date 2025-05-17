import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';
import 'package:proj_hiraya/common/widgets/appbar/main_menu_appbar.dart';
import 'package:proj_hiraya/common/widgets/buttons/floating_button.dart';
import 'package:proj_hiraya/features/hiraya_events/controllers/cards_list_controller.dart';
import 'package:proj_hiraya/features/hiraya_events/screens/cards_list.dart';
import 'package:proj_hiraya/features/hiraya_events/screens/create_event.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          LiquidPullRefresh(
            height: 100.0,
            backgroundColor: dark ? MainColors.black : const Color(0xFFFDFCE8),
            showChildOpacityTransition: false,
            color: MainColors.primary,
            animSpeedFactor: 3.0,
            onRefresh: () async {
              CardListController controller = Get.put(CardListController());
              controller.streamEvents();
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                Column(
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
                Divider(
                  color: MainColors.grey,
                  height: 1,
                  thickness: 1,
                ),

                // Main Content
                CardsList()
              ],
            ),
          ),

          // Floating Button
          MainFloatingButton(
            onPressed: () => Get.to(() => const MainCreateEventPage()),
          ),
        ],
      ),
    );
  }
}

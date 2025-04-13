import 'package:proj_hiraya/common/widgets/appbar/personalization_appbar.dart';
import 'package:proj_hiraya/common/widgets/appbar/tabbar.dart';
import 'package:proj_hiraya/common/widgets/custom_shapes/circular_image.dart';
import 'package:proj_hiraya/features/personalization/screens/widgets/filtered_posts.dart';
import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const PersonalizationAppBar(username: "@benedictcabintoy"),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? MainColors.black : MainColors.light,
                    expandedHeight: 160,
                    flexibleSpace: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const ListTile(
                          leading: MainCircularImage(
                            image: MainImages.avatarIcon,
                            width: 50,
                            padding: EdgeInsets.zero,
                            borderRadius: 50,
                          ),
                          title: Text("John Benedict Cabintoy"),
                          subtitle: Text("3 events joined • 3 events hosted"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: MainSizes.md,
                              vertical: MainSizes.sm / 2),
                          child: Text(
                            "About me is Lorem Ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                    bottom: const MainTabBar(tabs: [
                      Tab(
                        child: Text('Hosted'),
                      ),
                      Tab(
                        child: Text('Upvoted'),
                      ),
                      Tab(
                        child: Text('Joined'),
                      ),
                      Tab(
                        child: Text('Saved'),
                      )
                    ]))
              ];
            },
            body: const TabBarView(children: [
              FilteredPosts(
                child: Text("Hosted"),
              ),
              FilteredPosts(
                child: Text("Upvoted"),
              ),
              FilteredPosts(
                child: Text("Joined"),
              ),
              FilteredPosts(
                child: Text("Saved"),
              ),
            ])),
      ),
    );
  }
}

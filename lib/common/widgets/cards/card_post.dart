import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainCardPost extends StatelessWidget {
  const MainCardPost(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.upvotes,
      required this.comments});

  final String title;
  final String imageUrl;
  final String upvotes;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: MainSizes.itemGap / 2,
      ),
      elevation: 0,
      shape: const LinearBorder(),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MainSizes.sm),
            child: Row(
              children: [
                // Title
                Text(title, style: Theme.of(context).textTheme.bodyLarge),

                const Spacer(),

                // Menu button
                IconButton(
                  icon: const Icon(Icons.more_vert, size: 16),
                  onPressed: () => {},
                ),

                // Close button to hide post
                IconButton(
                  icon: const Icon(ZondIcons.close, size: 12),
                  onPressed: () => {},
                ),
              ],
            ),
          ),

          // Content image
          Container(
              height: 240,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(child: Text('Image Placeholder'))),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                // Upvote
                IconButton(
                  icon: const Icon(
                    ZondIcons.arrow_thick_up,
                    size: 16,
                  ),
                  onPressed: () => {},
                ),
                Text(upvotes),

                const SizedBox(width: MainSizes.itemGap),

                // Comments
                IconButton(
                  icon: const Icon(BoxIcons.bx_comment, size: 16),
                  onPressed: () => {},
                ),
                Text(comments),

                const Spacer(),

                // Share
                IconButton(
                  icon: const Icon(FontAwesome.share_solid, size: 16),
                  onPressed: () => {},
                ),
                Text('Share', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(width: MainSizes.itemGap),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/features/hiraya_events/screens/event_comments.dart';

class MainCardPost extends StatefulWidget {
  const MainCardPost({
    super.key,
    required this.title,
    required this.eventId,
    required this.imageUrl,
    required this.upvotes,
    required this.comments,
  });

  final String title;
  final String eventId;
  final String imageUrl;
  final int upvotes;
  final String comments;

  @override
  State<MainCardPost> createState() => _MainCardPostState();
}

class _MainCardPostState extends State<MainCardPost> {
  bool _isImageLoading = true;
  bool _isImageError = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: MainSizes.itemGap / 2),
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
                Text(widget.title,
                    style: Theme.of(context).textTheme.bodyLarge),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_vert, size: 16),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(ZondIcons.close, size: 12),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Content image
          Container(
            height: 240,
            width: double.infinity,
            color: Colors.grey[300],
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (_isImageLoading)
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.grey[300]),
                  ),
                Center(
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        if (_isImageLoading) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted) {
                              setState(() => _isImageLoading = false);
                            }
                          });
                        }
                        return child;
                      }
                      return const SizedBox(); // shimmer still shows
                    },
                    errorBuilder: (context, error, stackTrace) {
                      if (!_isImageError) {
                        setState(() {
                          _isImageError = true;
                          _isImageLoading = false;
                        });
                      }
                      return const Icon(Icons.error,
                          size: 48, color: Colors.red);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Interaction Row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(ZondIcons.arrow_thick_up, size: 16),
                  onPressed: () {},
                ),
                Text(widget.upvotes.toString()),
                const SizedBox(width: MainSizes.itemGap),
                IconButton(
                  icon: const Icon(BoxIcons.bx_comment, size: 16),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EventComments(
                        title: widget.title,
                        authorId: widget.eventId,
                        imageUrl: widget.imageUrl,
                        description:
                            'This is a placeholder description for the post.',
                        comments: const [
                          'Great post!',
                          'Interesting perspective.',
                          'Thanks for sharing!',
                        ],
                      ),
                    ));
                  },
                ),
                Text(widget.comments),
                const Spacer(),
                IconButton(
                  icon: const Icon(FontAwesome.share_solid, size: 16),
                  onPressed: () {},
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

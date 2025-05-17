import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/features/hiraya_events/controllers/event_comments_controller.dart';
import 'package:shimmer/shimmer.dart';

class EventComments extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String authorId;
  final List<String> comments;

  const EventComments({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.authorId,
    required this.comments,
  });

  @override
  EventCommentsState createState() => EventCommentsState();
}

class EventCommentsState extends State<EventComments> {
  final bool _isImageLoading = false;
  late final EventCommentsController _eventCommentsController;

  @override
  void initState() {
    super.initState();
    _eventCommentsController = Get.put(
      EventCommentsController(authorId: widget.authorId),
      tag: widget.authorId, // optional tag to isolate per screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Post'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 28, // Adjust size as needed
                  child:
                      const Icon(Icons.person, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        final author =
                            _eventCommentsController.eventAuthor.value;
                        return Text(
                          author != null
                              ? 'Posted by ${author.username}'
                              : 'Loading...',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        );
                      }),
                      const SizedBox(height: 4),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _isImageLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                  )
                : Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(); // Keep shimmer visible while loading
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error,
                          size: 48, color: Colors.red);
                    },
                  ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle join action
                  },
                  child: const Text('Join'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Comments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Handle sending the comment
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
              height: 1,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.comments.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 0.8,
                height: 1,
              ),
              itemBuilder: (context, index) {
                final comment = widget.comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User ${index + 1}', // Placeholder username
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              comment,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

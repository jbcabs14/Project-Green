import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/common/widgets/cards/card_post.dart';
import 'package:proj_hiraya/features/hiraya_events/controllers/cards_list_controller.dart';

class CardsList extends StatelessWidget {
  const CardsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardListController());

    return Obx(() {
      if (controller.isError.value) {
        return const Center(child: Text('❌ Failed to load events.'));
      }

      if (controller.isLoading.value && controller.events.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.events.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.inbox, size: 64, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                'No posts yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                'Check back later or create the first event!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        );
      }

      return Column(
        children: controller.events
            .map((event) => MainCardPost(
                  eventId: event.id,
                  title: event.name,
                  imageUrl: event.imageUrl,
                  upvotes: 0,
                  comments: '0',
                ))
            .toList(),
      );
    });
  }
}

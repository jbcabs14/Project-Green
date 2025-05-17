import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/data/repositories/event_repo.dart';
import 'package:proj_hiraya/features/hiraya_events/models/event_model.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class CardListController extends GetxController {
  static CardListController get instance => Get.find();

  final RxList<EventModel> events = <EventModel>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(EventRepository());

    streamEvents();
  }

  Future<void> streamEvents() async {
    try {
      isLoading.value = true;
      isError.value = false;

      final userSnapshots =
          await EventRepository.instance.db.collection(MainTexts.userDoc).get();

      events.clear();

      for (final userDoc in userSnapshots.docs) {
        final data = userDoc.data();

        if (data.containsKey('events') && data['events'] is List) {
          final eventList = data['events'] as List;

          for (final rawEvent in eventList) {
            if (rawEvent is Map<String, dynamic>) {
              try {
                final event = EventModel.fromJson(rawEvent);
                events.add(event); // <- Yield-like behavior
              } catch (e) {
                if (Get.isSnackbarOpen == false) {
                  if (kDebugMode) {
                    print('Error parsing event: $e');
                  }
                }
              }
            }
          }
        }
      }
    } catch (e) {
      isError.value = true;
      Future.microtask(() {
        if (!Get.isSnackbarOpen) {
          Get.snackbar('Error', 'Failed to fetch events: $e');
        }
      });
    } finally {
      isLoading.value = false;
    }
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proj_hiraya/data/repositories/event_repo.dart';
import 'package:proj_hiraya/features/hiraya_events/controllers/cards_list_controller.dart';
import 'package:proj_hiraya/features/hiraya_events/models/event_model.dart';
import 'package:proj_hiraya/utils/popups/full_screen_loader.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';

class CreateEventController extends GetxController {
  static CreateEventController get instance => Get.find();

  final eventName = TextEditingController();
  final eventDescription = TextEditingController();
  final eventLocation = TextEditingController();
  final eventIsHazardous = false.obs;
  final eventDate = TextEditingController();
  final eventStartTime = TextEditingController();
  final eventEndTime = TextEditingController();
  final eventFormKey = GlobalKey<FormState>();
  final Rx<File?> eventImage = Rx<File?>(null);

  final isLoading = false.obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      eventImage.value = File(pickedFile.path);
    } else {
      MainLoaders.warningSnackbar(
          title: 'No Image', message: 'No image selected.');
    }
  }

  void submitEvent() async {
    try {
      MainFullScreenLoader.openLoadingDialog(
        'Submitting your event...',
        MainImages.docerAnimation,
      );

      // Validate form
      if (!eventFormKey.currentState!.validate()) {
        MainFullScreenLoader.stopLoading();
        MainLoaders.errorSnackbar(
          title: 'Error',
          message: 'Please fill in all required fields.',
        );
        return;
      }

      // Upload image if selected
      final imageUrl =
          await EventRepository.instance.uploadEventImage(eventImage.value!);

      // Create event model
      final event = EventModel(
        id: FirebaseAuth.instance.currentUser!.uid,
        name: eventName.text,
        description: eventDescription.text,
        location: eventLocation.text,
        isHazardous: eventIsHazardous.value,
        date: eventDate.text,
        startTime: eventStartTime.text,
        endTime: eventEndTime.text,
        imageUrl: imageUrl,
        upvotes: 0,
      );

      // Save event to Firestore
      await EventRepository.instance.saveEvent(event);
      MainFullScreenLoader.stopLoading();
      Get.back();
      CardListController.instance.streamEvents();

      MainLoaders.successSnackbar(
        title: 'Event Created!',
        message: 'Your event has been successfully created.',
      );
    } catch (e) {
      MainFullScreenLoader.stopLoading();
      MainLoaders.errorSnackbar(
        title: 'Error',
        message: 'Failed to create event. Please try again. $e',
      );
    }
  }

  @override
  void dispose() {
    eventName.dispose();
    eventDescription.dispose();
    eventLocation.dispose();
    eventDate.dispose();
    eventStartTime.dispose();
    eventEndTime.dispose();
    super.dispose();
  }
}

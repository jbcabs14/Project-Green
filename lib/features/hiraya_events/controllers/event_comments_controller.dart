import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:proj_hiraya/data/repositories/user_repo.dart';
import 'package:proj_hiraya/features/personalization/models/user_model.dart';

class EventCommentsController extends GetxController {
  static EventCommentsController get instance => Get.find();

  final Rx<UserModel?> eventAuthor = Rx<UserModel?>(null);
  final commentController = TextEditingController();
  final isLoading = false.obs;

  final String authorId;

  EventCommentsController({required this.authorId});

  @override
  void onInit() {
    super.onInit();
    loadAuthor();
  }

  void loadAuthor() async {
    try {
      UserRepository userRepository = Get.put(UserRepository());
      final user = await userRepository.fetchUserById(authorId);
      eventAuthor.value = user;
    } catch (e) {
      Future.microtask(() {
        if (!Get.isSnackbarOpen) {
          Get.snackbar('Error', 'Failed to load event author $e');
        }
      });
    }
  }

  void sendComment(String eventId) async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      commentController.clear();
    } catch (e) {
      Get.snackbar('Error', 'Failed to send comment: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}

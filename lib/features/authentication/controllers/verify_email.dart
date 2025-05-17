import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/data/repositories/authentication_repo.dart';
import 'package:proj_hiraya/features/authentication/controllers/success/success_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen Appears & Set Timer For Auto Redirect.
  @override
  void onInit() {
    sendEmailVerificationLink();
    setTimeForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerificationLink() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MainLoaders.successSnackbar(
          title: 'Email Sent!',
          message: 'Please check your email to verify your account.');
    } catch (e) {
      MainLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimeForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => const SuccessScreen());
      }
    });
  }

  /// Manually check if email verified
  checkEmailVerifiedStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => const SuccessScreen());
    }
  }
}

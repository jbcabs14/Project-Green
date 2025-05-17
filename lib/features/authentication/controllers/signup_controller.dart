import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/data/repositories/authentication_repo.dart';
import 'package:proj_hiraya/data/repositories/user_repo.dart';
import 'package:proj_hiraya/features/authentication/screens/verify/verify_email.dart';
import 'package:proj_hiraya/features/personalization/models/user_model.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/network/network_manager.dart';
import 'package:proj_hiraya/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final confirmPassword = TextEditingController();
  final mobileNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //start loading
      MainFullScreenLoader.openLoadingDialog(
          'We are processing your information...', MainImages.docerAnimation);

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MainFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        MainFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy Check
      if (!privacyPolicy.value) {
        MainLoaders.warningSnackbar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Service.');
        MainFullScreenLoader.stopLoading();
        return;
      }

      //Register user in the FireBase Authentication & save user in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text,
        phoneNumber: mobileNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Show Success Message
      MainLoaders.successSnackbar(
          title: 'Success!',
          message:
              'Your account has been created successfully! Verify Email to continue.');

      //Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //stop loading
      MainFullScreenLoader.stopLoading();
      //show error message
      Get.snackbar('Error', e.toString());
    }
  }
}

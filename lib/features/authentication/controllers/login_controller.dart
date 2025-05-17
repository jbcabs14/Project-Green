import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/data/repositories/authentication_repo.dart';
import 'package:proj_hiraya/features/authentication/screens/login/login.dart';
import 'package:proj_hiraya/features/personalization/controllers/user_controller.dart';
import 'package:proj_hiraya/features/personalization/models/user_model.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/network/network_manager.dart';
import 'package:proj_hiraya/utils/popups/full_screen_loader.dart';
import 'package:proj_hiraya/utils/popups/full_screen_loader_gif.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final hidePassword = true.obs;
  final rememberMe = true.obs;

  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();
  final userController = Get.put(UserController());

  Future<void> login() async {
    try {
      MainFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        MainImages.loadingIllustration,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MainFullScreenLoader.stopLoading();
        MainLoaders.errorSnackbar(
          title: 'Connection Error',
          message: 'You are not connected to the internet.',
        );
        return;
      }

      // Firebase email/password sign-in
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(username.text.trim(), password.text);

      if (userCredential == null) {
        MainFullScreenLoader.stopLoading();
        MainLoaders.errorSnackbar(
          title: 'Login Failed',
          message: 'Invalid credentials or user not found.',
        );
        return;
      }

      MainFullScreenLoaderGif.openLoadingDialog(
        'Success!',
        'You are now logged in!',
        MainImages.loginSuccessIllustration,
      );

      await Future.delayed(const Duration(seconds: 2));
      MainFullScreenLoader.stopLoading();

      // Redirect to appropriate screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MainFullScreenLoader.stopLoading();
      MainLoaders.errorSnackbar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    try {
      MainFullScreenLoader.openLoadingDialog(
          'Signing you out...', MainImages.loadingIllustration);
      userController.user(UserModel.empty());
      await AuthenticationRepository.instance.auth.signOut();
      await GoogleSignIn().signOut();

      MainFullScreenLoaderGif.openLoadingDialog('Success!',
          'You are now logged out!', MainImages.loginSuccessIllustration);
      await Future.delayed(const Duration(seconds: 2));

      MainFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      MainFullScreenLoader.stopLoading();
      MainLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      MainFullScreenLoader.openLoadingDialog(
          'Logging you in...', MainImages.loadingIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MainFullScreenLoader.stopLoading();
        MainLoaders.errorSnackbar(
            title: 'Connection Error',
            message: 'You are not connected to the internet.');
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      if (userCredentials == null) {
        MainFullScreenLoader.stopLoading();
        return;
      }

      await userController.saveUserRecord(userCredentials);

      MainFullScreenLoaderGif.openLoadingDialog('Success!',
          'You are now logged in!', MainImages.loginSuccessIllustration);
      await Future.delayed(const Duration(seconds: 2));

      MainFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MainFullScreenLoader.stopLoading();
      MainLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

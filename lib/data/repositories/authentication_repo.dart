import 'package:proj_hiraya/data/repositories/user_repo.dart';
import 'package:proj_hiraya/features/authentication/screens/login/login.dart';
import 'package:proj_hiraya/features/personalization/models/user_model.dart';
import 'package:proj_hiraya/main_menu.dart';
import 'package:proj_hiraya/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:proj_hiraya/utils/exceptions/firebase_exceptions.dart';
import 'package:proj_hiraya/utils/exceptions/format_exceptions.dart';
import 'package:proj_hiraya/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;

  User? get authUser => auth.currentUser;

  @override
  void onReady() async {
    Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = authUser;

    if (user != null) {
      Get.offAll(() => const MainMenu());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  Future<UserModel?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Safety check
      final user = userCredential.user;
      if (user == null) throw 'User not found after login.';

      // Fetch user profile from Firestore or local DB
      UserRepository userRepository = Get.put(UserRepository());
      final userModel = await userRepository.fetchUserById(user.uid);
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw MainFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw MainFormatException(e.message);
    } on PlatformException catch (e) {
      throw MainPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong during login: $e');
      rethrow;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final userAccount = await GoogleSignIn().signIn();

      if (userAccount == null) {
        return null;
      }

      final googleAuth = await userAccount.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      return await auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw MainFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw MainFormatException(e.message);
    } on PlatformException catch (e) {
      throw MainPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      rethrow;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credentials = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credentials;
    } on FirebaseAuthException catch (e) {
      throw MainFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw MainFormatException(e.message);
    } on PlatformException catch (e) {
      throw MainPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MainFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw MainFormatException(e.message);
    } on PlatformException catch (e) {
      throw MainPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      rethrow;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/features/authentication/controllers/verify_email.dart';
import 'package:proj_hiraya/features/authentication/screens/login/login.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //? Padding to Give Default Equal Space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(MainSizes.defaultSpace),
          child: Column(
            children: [
              //? Image
              Image(
                  image: const AssetImage(MainImages.verifyEmail),
                  width: HelperFunctions.screenSizeWidth() * 0.6),
              const SizedBox(height: MainSizes.sectionGap),

              //? Title & Subtitle
              Text(MainTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MainSizes.itemGap),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MainSizes.itemGap),
              Text(MainTexts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MainSizes.sectionGap),

              //? Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerifiedStatus(),
                      child: const Text(MainTexts.econtinue))),
              const SizedBox(height: MainSizes.itemGap),
              TextButton(
                  onPressed: () => controller.sendEmailVerificationLink(),
                  child: Text(MainTexts.resendEmail,
                      style: Theme.of(context).textTheme.labelMedium)),
            ],
          ),
        ),
      ),
    );
  }
}

//import 'package:proj_hiraya/common/widgets/loaders/animation_loaders.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? MainColors.dark
              : MainColors.white,
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              SizedBox(height: 250),
              //MainAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

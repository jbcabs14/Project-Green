import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Page
          PageView(
            children: [
              Column(
                children: [
                  /// Image/Color Background
                  Image(
                    width: HelperFunctions.screenSizeWidth() * 0.8,
                    height: HelperFunctions.screenSizeHeight() * 0.6,
                    image: const AssetImage(MainImages.onboarding1),)
                ],
              ),

              /// Page 1
              /// Page 2
              /// Page 3
            ],
          ),

          /// Skip Button

          /// Dot Navigation SmoothPageIndicator

          /// Circular Button
        ],
      ),
    );
  }
}

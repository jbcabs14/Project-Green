import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();

  //Variables

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) {}

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {}

  /// Update Current Index & jump to next page
  void nextPage() {}

  /// update current index & jump to lost page
  void skipPage() {}
}

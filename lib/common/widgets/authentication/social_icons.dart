import 'package:proj_hiraya/features/authentication/controllers/login_controller.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/image_strings.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: MainColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () => controller.googleSignIn(),
          icon: const Image(
              width: MainSizes.iconMd,
              height: MainSizes.iconMd,
              image: AssetImage(MainImages.googleLogo)),
        ),
      )
    ]);
  }
}

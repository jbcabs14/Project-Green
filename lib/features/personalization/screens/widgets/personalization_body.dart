import 'package:flutter/material.dart';
import 'package:proj_hiraya/features/authentication/controllers/login_controller.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class PersonalizationContent extends StatelessWidget {
  const PersonalizationContent({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: MainSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => loginController.logout(),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: MainColors.error,
                      side: const BorderSide(width: 0)),
                  child: Text('Logout',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: MainColors.white))),
            ),
          ],
        ));
  }
}

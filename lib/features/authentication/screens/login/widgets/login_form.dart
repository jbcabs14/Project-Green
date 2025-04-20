import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/features/authentication/controllers/login_controller.dart';
import 'package:proj_hiraya/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class MainLoginForm extends StatelessWidget {
  const MainLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for the form
    final controller = Get.put(LoginController());

    return Form(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: MainSizes.sectionGap),
            child: Column(
              children: [
                // Email
                TextFormField(
                  validator: null,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: MainTexts.email,
                  ),
                ),

                const SizedBox(height: MainSizes.itemGap),

                // Password
                TextFormField(
                  validator: null,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.lock),
                      labelText: MainTexts.password,
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),

                const SizedBox(height: MainSizes.inputFieldGap / 2),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Me
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) => {},
                        ),
                        const Text(MainTexts.rememberMe),
                      ],
                    ),

                    // Forgot Password
                    TextButton(
                        onPressed: () =>
                            Get.to(() => const ForgotPasswordPage()),
                        child: Text(MainTexts.forgotPassword,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: MainColors.primary))),
                  ],
                ),

                const SizedBox(height: MainSizes.sectionGap),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.login(),
                      child: const Text(MainTexts.signIn)),
                )
              ],
            )));
  }
}

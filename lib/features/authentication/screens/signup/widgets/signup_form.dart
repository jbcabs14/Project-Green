import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';
import 'package:proj_hiraya/features/authentication/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/utils/validators/validation.dart';

class MainSignupForm extends StatelessWidget {
  const MainSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      MainValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MainTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
                const SizedBox(width: MainSizes.inputFieldGap),
                Expanded(
                    child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      MainValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MainTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
              ],
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Username
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  MainValidator.validateEmptyText('Username', value),
              decoration: const InputDecoration(
                  labelText: MainTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) =>
                  MainValidator.validateEmptyText('Email', value),
              decoration: const InputDecoration(
                  labelText: MainTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Phone number
            TextFormField(
              controller: controller.mobileNumber,
              validator: (value) =>
                  MainValidator.validateEmptyText('Mobile Number', value),
              decoration: const InputDecoration(
                  labelText: MainTexts.mobileNumber,
                  prefixIcon: Icon(Iconsax.call)),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Password
            Obx(
              () => TextFormField(
                validator: (value) =>
                    MainValidator.validateEmptyText('Password', value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: MainTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: const Icon(Iconsax.eye_slash),
                    )),
              ),
            ),

            const SizedBox(height: MainSizes.itemGap),

            // Confirm Password
            Obx(
              () => TextFormField(
                validator: (value) =>
                    MainValidator.validateEmptyText('Confirm Password', value),
                controller: controller.confirmPassword,
                obscureText: controller.hideConfirmPassword.value,
                decoration: InputDecoration(
                    labelText: MainTexts.confirmPassword,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hideConfirmPassword.value =
                          !controller.hideConfirmPassword.value,
                      icon: const Icon(Iconsax.eye_slash),
                    )),
              ),
            ),

            const SizedBox(height: MainSizes.sectionGap),

            // Terms and conditions checkbox
            const TermsAndConditions(),

            const SizedBox(height: MainSizes.sectionGap),

            // Sign up button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(MainTexts.createMyAccount))),
          ],
        ),
      ),
    );
  }
}

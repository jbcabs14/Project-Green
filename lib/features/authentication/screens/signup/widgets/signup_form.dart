import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class MainSignupForm extends StatelessWidget {
  const MainSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Form(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  validator: null,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MainTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
                const SizedBox(width: MainSizes.inputFieldGap),
                Expanded(
                    child: TextFormField(
                  validator: null,
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
              validator: null,
              decoration: const InputDecoration(
                  labelText: MainTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Email
            TextFormField(
              validator: null,
              decoration: const InputDecoration(
                  labelText: MainTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Phone number
            TextFormField(
              validator: null,
              decoration: const InputDecoration(
                  labelText: MainTexts.mobileNumber,
                  prefixIcon: Icon(Iconsax.call)),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Password
            TextFormField(
              validator: null,
              decoration: InputDecoration(
                  labelText: MainTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.eye_slash),
                  )),
            ),

            const SizedBox(height: MainSizes.itemGap),

            TextFormField(
              validator: null,
              decoration: InputDecoration(
                  labelText: MainTexts.confirmPassword,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.eye_slash),
                  )),
            ),

            const SizedBox(height: MainSizes.sectionGap),

            // Terms and conditions checkbox
            const TermsAndConditions(),

            const SizedBox(height: MainSizes.sectionGap),

            // Sign up button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text(MainTexts.createMyAccount))),
          ],
        ),
      ),
    );
  }
}

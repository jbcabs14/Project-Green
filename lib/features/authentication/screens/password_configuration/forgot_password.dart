import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(MainSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MainTexts.forgotPassword,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: MainSizes.itemGap),
              Text(
                MainTexts.forgotPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: MainSizes.sectionGap * 2),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: MainTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: MainSizes.sectionGap),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle password reset logic here
                  },
                  child: const Text(MainTexts.submit),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainTabContent extends StatelessWidget {
  final String label;
  const MainTabContent({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (_, i) => Card(
        margin: const EdgeInsets.only(bottom: MainSizes.cardGap),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('$label Post ${i + 1}'),
        ),
      ),
    );
  }
}

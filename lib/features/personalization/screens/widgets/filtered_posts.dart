import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class FilteredPosts extends StatelessWidget {
  const FilteredPosts({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MainSizes.defaultSpace),
      child: child,
    );
  }
}

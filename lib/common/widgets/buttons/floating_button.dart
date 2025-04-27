import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';

class MainFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MainFloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0, // Distance from the bottom of the screen
      right: 16.0, // Distance from the right of the screen
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: MainColors.primary, // Background color of the button
        child: const Icon(
          Icons.edit, // Pen icon
          color: Colors.white, // Icon color
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MainDrawerTile extends StatelessWidget {
  const MainDrawerTile(
      {super.key, required this.icon, required this.title, this.onTap});

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

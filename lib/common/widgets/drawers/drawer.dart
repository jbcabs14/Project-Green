import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          ListTile(
            leading: Icon(Iconsax.home_1),
            title: Text('Home'),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Iconsax.setting),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

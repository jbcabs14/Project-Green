import 'package:flutter/material.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: const Text('Notifications'),
        showBackArrow: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.checklist_rounded),
            onPressed: () {
              MainLoaders.successSnackbar(
                title: 'Notifications',
                message: 'Marked all notifications as read.',
              );
            },
          ),
        ],
        elevation: 1,
      ),
    );
  }
}

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/common/widgets/loaders/loaders.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainCreateEventPage extends StatelessWidget {
  const MainCreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingIcon: ZondIcons.close,
        leadingOnPressed: () => Get.back(),
        title: const Text('Create Event'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                // Handle post action
                MainLoaders.successSnackbar(
                  title: 'Event Created',
                  message: 'Your event has been successfully created.',
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: MainColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(MainSizes.defaultSpace / 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: MainSizes.itemGap),

              // Description Field
              const TextField(
                maxLength: 280,
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true),
              ),
              const SizedBox(height: MainSizes.itemGap),

              // Time Schedule
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true, // Prevent manual input
                      decoration: const InputDecoration(
                        labelText: 'Start Time',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        Navigator.of(context).push(showPicker(
                          context: context,
                          value: Time.fromTimeOfDay(TimeOfDay.now(), null),
                          onChange: (Time time) {
                            // Handle selected time
                            MainLoaders.successSnackbar(
                              title: 'Time Selected',
                              message:
                                  'Selected time: ${time.hour}:${time.minute}',
                            );
                          },
                        ));
                      },
                    ),
                  ),
                  const SizedBox(width: MainSizes.itemGap),
                  Expanded(
                    child: TextFormField(
                      readOnly: true, // Prevent manual input
                      decoration: const InputDecoration(
                        labelText: 'End Time',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        Navigator.of(context).push(showPicker(
                          context: context,
                          value: Time.fromTimeOfDay(TimeOfDay.now(), null),
                          onChange: (Time time) {
                            // Handle selected time
                            MainLoaders.successSnackbar(
                              title: 'Time Selected',
                              message:
                                  'Selected time: ${time.hour}:${time.minute}',
                            );
                          },
                        ));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: MainSizes.itemGap),

              // Location Field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: MainSizes.itemGap),

              // Hazardous Checkbox
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Handle checkbox state
                    },
                  ),
                  const Text('Flag as hazardous'),
                ],
              ),
              const SizedBox(height: MainSizes.itemGap),

              // Image Upload Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upload Image (Required)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle image upload
                      MainLoaders.successSnackbar(
                        title: 'Image Upload',
                        message: 'Image upload functionality not implemented.',
                      );
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '* Only 1 image is allowed.',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

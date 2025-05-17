import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj_hiraya/common/widgets/appbar/appbar.dart';
import 'package:proj_hiraya/features/hiraya_events/controllers/create_event_controller.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainCreateEventPage extends StatelessWidget {
  const MainCreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateEventController());

    return Scaffold(
      appBar: MainAppBar(
        leadingIcon: ZondIcons.close,
        leadingOnPressed: () => Get.back(),
        title: const Text('Create Event'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () => controller.submitEvent(),
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
          child: Form(
            key: controller.eventFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.eventName,
                  validator: (value) =>
                      value!.isEmpty ? 'Title is required' : null,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: MainSizes.itemGap),
                TextFormField(
                  controller: controller.eventDescription,
                  maxLength: 280,
                  maxLines: 4,
                  validator: (value) =>
                      value!.isEmpty ? 'Description is required' : null,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true),
                ),
                const SizedBox(height: MainSizes.itemGap),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.eventStartTime,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Start Time',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () {
                          Navigator.of(context).push(showPicker(
                            context: context,
                            value: Time.fromTimeOfDay(TimeOfDay.now(), null),
                            onChange: (Time time) {
                              controller.eventStartTime.text =
                                  '${time.hour}:${time.minute}';
                            },
                          ));
                        },
                      ),
                    ),
                    const SizedBox(width: MainSizes.itemGap),
                    Expanded(
                      child: TextFormField(
                        controller: controller.eventEndTime,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'End Time',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () {
                          Navigator.of(context).push(showPicker(
                            context: context,
                            value: Time.fromTimeOfDay(TimeOfDay.now(), null),
                            onChange: (Time time) {
                              controller.eventEndTime.text =
                                  '${time.hour}:${time.minute}';
                            },
                          ));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: MainSizes.itemGap),
                TextFormField(
                  controller: controller.eventLocation,
                  validator: (value) =>
                      value!.isEmpty ? 'Location is required' : null,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: MainSizes.itemGap),
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.eventIsHazardous.value,
                        onChanged: (value) {
                          controller.eventIsHazardous.value = value!;
                        })),
                    const Text('Flag as hazardous'),
                  ],
                ),
                const SizedBox(height: MainSizes.itemGap),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Image (Required)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Obx(() => GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                              image: controller.eventImage.value != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          controller.eventImage.value!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: controller.eventImage.value == null
                                ? const Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  )
                                : null,
                          ),
                        )),
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
      ),
    );
  }
}

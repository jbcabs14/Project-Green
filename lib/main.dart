import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/app.dart';
import 'package:proj_hiraya/firebase_options.dart';

Future<void> main() async {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp app) => Get.put(null));
  // Todo: Initialize Authentication

  runApp(const Hiraya());
}

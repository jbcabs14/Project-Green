import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proj_hiraya/app.dart';
import 'package:proj_hiraya/data/repositories/authentication_repo.dart';
import 'package:proj_hiraya/firebase_options.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp app) => Get.put(AuthenticationRepository()));

  // Init Supabase
  await Supabase.initialize(
      url: 'https://zpdwbxktjqjlzuwqglqy.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpwZHdieGt0anFqbHp1d3FnbHF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU0MTIxNjMsImV4cCI6MjA2MDk4ODE2M30.z1LbZzoroeAEDI75y9apb5BqTlV9T64EdDsq7obE19k',
      accessToken: () async {
        final token = await FirebaseAuth.instance.currentUser?.getIdToken();
        return token;
      });

  // Todo: Initialize Authentication
  runApp(const Hiraya());
}

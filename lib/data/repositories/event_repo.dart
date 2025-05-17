import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proj_hiraya/data/repositories/authentication_repo.dart';
import 'package:proj_hiraya/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:uuid/uuid.dart';

import 'package:proj_hiraya/features/hiraya_events/models/event_model.dart';
import 'package:proj_hiraya/utils/exceptions/firebase_exceptions.dart';
import 'package:proj_hiraya/utils/exceptions/platform_exceptions.dart';
import 'package:proj_hiraya/utils/exceptions/format_exceptions.dart';
import 'package:proj_hiraya/utils/constants/texts.dart';

class EventRepository extends GetxController {
  static EventRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  /// Uploads the image to Firebase Storage and returns the download URL
  Future<String> uploadEventImage(File imageFile) async {
    try {
      final fileId = const Uuid().v4();
      final extension = imageFile.path.split('.').last;
      final ref =
          _storage.ref().child('${MainTexts.eventImages}/$fileId.$extension');

      // Upload with optional metadata
      await ref.putFile(
        imageFile,
        SettableMetadata(contentType: 'image/$extension'),
      );

      return await ref.getDownloadURL();
    } catch (e) {
      if (kDebugMode) print('Image upload failed: $e');
      throw 'Image upload failed. $e';
    }
  }

  /// Saves event data to Firestore
  Future<void> saveEvent(EventModel event) async {
    try {
      final userId = AuthenticationRepository.instance.auth.currentUser!.uid;
      final userRef = db.collection(MainTexts.userDoc).doc(userId);

      await userRef.update({
        'events': FieldValue.arrayUnion([event.toJson()])
      });
    } on FirebaseAuthException catch (e) {
      throw MainFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MainPlatformException(e.code).message;
    } on FormatException catch (e) {
      throw MainFormatException(e.message);
    } catch (e) {
      if (kDebugMode) print('Unexpected error: $e');
      throw 'Something went wrong while saving the event.';
    }
  }

  Future<void> deleteEventFromUser(EventModel event) async {
    try {
      final userId = AuthenticationRepository.instance.auth.currentUser!.uid;
      final userRef = db.collection(MainTexts.userDoc).doc(userId);

      await userRef.update({
        'events': FieldValue.arrayRemove([event.toJson()])
      });
    } catch (e) {
      if (kDebugMode) print('Error deleting event: $e');
      throw 'Failed to delete event.';
    }
  }

  /// Fetches all events
  Future<List<EventModel>> fetchAllEventsFromAllUsers() async {
    try {
      final userSnapshots = await db.collection(MainTexts.userDoc).get();

      final List<EventModel> allEvents = [];

      for (final userDoc in userSnapshots.docs) {
        final data = userDoc.data();

        if (data.containsKey('events') && data['events'] is List) {
          final eventList = data['events'] as List;

          for (final event in eventList) {
            if (event is Map<String, dynamic>) {
              try {
                allEvents.add(EventModel.fromJson(event));
              } catch (e) {
                if (kDebugMode) {
                  print('Failed to parse an event: $e');
                }
                // Optionally skip or throw
              }
            }
          }
        }
      }

      return allEvents;
    } catch (e) {
      if (kDebugMode) print('Error fetching all events: $e');
      throw 'Unable to fetch events. Please try again later.';
    }
  }

  Future<void> updateEventForCurrentUser(EventModel updatedEvent) async {
    try {
      final userId = AuthenticationRepository.instance.auth.currentUser!.uid;
      final userRef = db.collection(MainTexts.userDoc).doc(userId);

      // Get current user document
      final docSnapshot = await userRef.get();
      if (!docSnapshot.exists) throw 'User not found';

      final data = docSnapshot.data();
      final List<EventModel> updatedEvents = [];

      if (data != null && data['events'] != null && data['events'] is List) {
        for (final item in data['events']) {
          if (item is Map<String, dynamic>) {
            final event = EventModel.fromJson(item);
            if (event.id == updatedEvent.id) {
              updatedEvents.add(updatedEvent); // replace
            } else {
              updatedEvents.add(event); // keep others
            }
          }
        }
      }

      // Overwrite the whole events array
      await userRef.update({
        'events': updatedEvents.map((e) => e.toJson()).toList(),
      });
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Failed to update event: $e');
      throw 'Failed to update the event.';
    }
  }
}

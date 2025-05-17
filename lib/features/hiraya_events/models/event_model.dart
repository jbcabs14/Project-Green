import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String name;
  final String description;
  final String location;
  final bool isHazardous;
  final String date;
  final String startTime;
  final String endTime;
  final String imageUrl;
  final int upvotes;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.isHazardous,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.imageUrl,
    required this.upvotes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'location': location,
        'isHazardous': isHazardous,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'imageUrl': imageUrl,
        'upvotes': upvotes,
      };

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      isHazardous: json['isHazardous'] ?? false,
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      upvotes: json['upvotes'] ?? 0,
    );
  }

  factory EventModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return EventModel(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      location: data['location'],
      isHazardous: data['isHazardous'],
      date: data['date'],
      startTime: data['startTime'],
      endTime: data['endTime'],
      imageUrl: data['imageUrl'],
      upvotes: data['upvotes'],
    );
  }
}

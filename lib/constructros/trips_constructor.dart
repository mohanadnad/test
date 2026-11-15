// ignore_for_file: constant_identifier_names

import 'package:latlong2/latlong.dart';
// import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
// import 'package:sudan_tourist_guide/constructros/resturnt_constructor.dart';

class TripsConstructor {
  final String id;
  final LatLng location;
  final String title;
  final String titleEn;
  final String imageUrl;
  final String categories;
  final List<String> activities;
  final List<String> activitiesEn;
  final String type = 'trip';
  final String cityName;
  final String cityNameEn;
  final String travelType;
  final String travelTypeEn;
  final int budget;
  final int rating;
  final double avgRating;
  const TripsConstructor({
    required this.location,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.categories,
    required this.activities,
    required this.cityName,
    required this.titleEn,
    required this.activitiesEn,
    required this.cityNameEn,
    required this.travelType,
    required this.travelTypeEn,
    required this.budget,
    required this.rating,
    required this.avgRating,
  });

  factory TripsConstructor.fromJson(Map<String, dynamic> json) {
    return TripsConstructor(
      avgRating: double.tryParse(json["avgRating"].toString()) ?? 0.0,
      budget: json['budget'] ?? 0,
      travelType: json['travelType'] ?? "",
      travelTypeEn: json['travelTypeEn'] ?? "",
      id: json['id']?.toString() ?? "",
      title: json['title'] ?? "",
      titleEn: json['titleEn'] ?? "",
      cityName: json['cityName'] ?? "",
      cityNameEn: json['cityNameEn'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      categories: json['categoryId'] ?? "",
      activities: List<String>.from(json['activities'] ?? []),
      activitiesEn: List<String>.from(json['activitiesEn'] ?? []),
      rating: json['rating'] ?? 1,
      location: LatLng(
        (json['latitude'] is double)
            ? json['latitude']
            : double.tryParse(json['latitude']?.toString() ?? "0") ?? 0,
        (json['longitude'] is double)
            ? json['longitude']
            : double.tryParse(json['longitude']?.toString() ?? "0") ?? 0,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class TravelsConstructor {
  final String id;
  final String imageUrl;
  final String youtubeUrl;
  final String title;
  final String titleEn;
  final String cityName;
  final String cityNameEn;
  final String travelType;
  final String travelTypeEn;
  final String categories;
  final String discription;
  final String descriptionEn;
  final List<String> activities;
  final List<String> activitiesEn;
  final LatLng location;
  final List images;
  final String type = 'travel';
  final int budget;
  final int rating;
  final double avgRating;
  const TravelsConstructor({
    this.images = const [],
    required this.imageUrl,
    required this.youtubeUrl,
    required this.title,
    required this.discription,
    required this.id,
    required this.cityName,
    required this.travelType,
    required this.categories,
    required this.activities,
    required this.location,
    required this.titleEn,
    required this.cityNameEn,
    required this.descriptionEn,
    required this.activitiesEn,
    required this.travelTypeEn,
    required this.budget,
    required this.rating,
    required this.avgRating,
  });
  factory TravelsConstructor.fromJson(Map<String, dynamic> json) {
    return TravelsConstructor(
      avgRating: double.tryParse(json["avgRating"].toString()) ?? 0.0,
      rating: json['rating'] ?? 1,
      budget: json['budget'] ?? 0,
      id: json['id']?.toString() ?? "",
      imageUrl: json['imageUrl'] ?? "",
      youtubeUrl: json['youtubeUrl'] ?? "",
      title: json['title'] ?? "",
      titleEn: json['titleEn'] ?? "",
      discription: json['discription'] ?? "",
      descriptionEn: json['descriptionEn'] ?? "",
      cityName: json['cityName'] ?? "",
      cityNameEn: json['cityNameEn'] ?? "",
      travelType: json['travelType'] ?? "",
      travelTypeEn: json['travelTypeEn'] ?? "",
      categories: json['categoryId'] ?? "",
      activities: List<String>.from(json['activities'] ?? []),
      activitiesEn: List<String>.from(json['activitiesEn'] ?? []),
      images: List<String>.from(json['imageUrlList'] ?? []),
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

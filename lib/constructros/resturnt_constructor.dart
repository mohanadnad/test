import 'package:latlong2/latlong.dart';

class ResturntConstructor {
  final String id;
  final String imageUrl;
  final String title;
  final String titleEn;
  final String categories;
  final List<String> activities;
  final List<String> activitiesEn;
  final LatLng location;
  final String type = 'restaurant';
  final String cityName;
  final String cityNameEn;
  final String travelType;
  final String travelTypeEn;
  final int budget;
  final int rating;
  final String webUrl;
  final double avgRating;

  const ResturntConstructor({
    required this.categories,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.activities,
    required this.location,
    required this.cityName,
    required this.titleEn,
    required this.activitiesEn,
    required this.cityNameEn,
    required this.travelType,
    required this.travelTypeEn,
    required this.budget,
    required this.rating,
    required this.webUrl,
    required this.avgRating,
  });
  factory ResturntConstructor.fromJson(Map<String, dynamic> json) {
    return ResturntConstructor(
      webUrl: json['webUrl'] ?? '',
      rating: json['rating'] ?? 2,
      avgRating: double.tryParse(json["avgRating"].toString()) ?? 0.0,
      budget: json['budget'] ?? 0,
      travelType: json['travelType'] ?? "",
      travelTypeEn: json['travelTypeEn'] ?? "",
      id: json['id']?.toString() ?? "",
      imageUrl: json['imageUrl'] ?? "",
      title: json['title'] ?? "",
      titleEn: json['titleEn'] ?? "",
      cityName: json['cityName'] ?? "",
      cityNameEn: json['cityNameEn'] ?? "",
      categories: json['categoryId'] ?? "",
      activities: List<String>.from(json['activities'] ?? []),
      activitiesEn: List<String>.from(json['activitiesEn'] ?? []),
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

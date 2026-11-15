import 'package:latlong2/latlong.dart';

class HotelConstructor {
  final String imageUrl;
  final String title;
  final String titleEn;
  final String id;
  final String categories;
  final List<String> activities;
  final List<String> activitiesEn;
  final LatLng location;
  final String type = 'hotel';
  final String cityName;
  final String cityNameEn;
  final String travelType;
  final String travelTypeEn;
  final int budget;
  final int rating;
  final double avgRating;
  final String webUrl;

  const HotelConstructor({
    required this.cityName,
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.categories,
    required this.activities,
    required this.location,
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

  factory HotelConstructor.fromJson(Map<String, dynamic> json) {
    return HotelConstructor(
      webUrl: json['webUrl'] ?? '',
      budget: json['budget'] ?? 0,
      rating: json['rating'] ?? 2,
      travelTypeEn: json['travelTypeEn'] ?? "",
      cityName: json['cityName'] ?? "",
      cityNameEn: json['cityNameEn'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      title: json['title'] ?? "",
      titleEn: json['titleEn'] ?? "",
      id: json['id']?.toString() ?? "",
      categories: json['categoryId'] ?? "",
      activities: List<String>.from(json['activities'] ?? []),
      activitiesEn: List<String>.from(json['activitiesEn'] ?? []),
      travelType: json['travelType'] ?? "",
      location: LatLng(
        (json['latitude'] is double)
            ? json['latitude']
            : double.tryParse(json['latitude']?.toString() ?? "0") ?? 0,
        (json['longitude'] is double)
            ? json['longitude']
            : double.tryParse(json['longitude']?.toString() ?? "0") ?? 0,
      ),
      avgRating: double.tryParse(json["avgRating"].toString()) ?? 0.0,
    );
  }
}

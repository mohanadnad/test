// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:sudan_tourist_guide/constant/my_strings.dart';
// import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
// import 'package:sudan_tourist_guide/constructros/resturnt_constructor.dart';
// import 'package:sudan_tourist_guide/constructros/trips_constructor.dart';
// import '../app_information.dart';
// import '../constructros/category_constructor.dart';
// import '../constructros/travels_constructor.dart';

// // ===============================
// // CATEGORY
// // ===============================

// Future<void> uploadCategory(CategoryConstructor c) async {
//   final url = Uri.parse(addCategoryApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": c.id,
//       "title": c.title,
//       "title_en": c.titleEn,
//       "imageUrl": c.imageUrl,
//     }),
//   );
// }

// Future<void> uploadAllCategories() async {
//   for (final c in categoryInforamtion) {
//     await uploadCategory(c);
//   }
// }

// // ===============================
// // TRAVELS
// // ===============================

// Future<void> uploadTravel(TravelsConstructor t) async {
//   final url = Uri.parse(addTravelApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": t.id,
//       "title": t.title,
//       "titleEn": t.titleEn,
//       "cityName": t.cityName,
//       "cityNameEn": t.cityNameEn,
//       "travelType": t.travelType,
//       "travelTypeEn": t.travelTypeEn,
//       "discription": t.discription,
//       "descriptionEn": t.descriptionEn,
//       "imageUrl": t.imageUrl,
//       "youtubeUrl": t.youtubeUrl,
//       "latitude": t.location.latitude,
//       "longitude": t.location.longitude,
//       "categoryId": t.categories,
//       "budget": t.budget,
//     }),
//   );
// }

// Future<void> uploadTravelImages(TravelsConstructor t) async {
//   if (t.images.isEmpty) return;

//   final url = Uri.parse(addTravelImagesApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({"travel_id": t.id, "imageUrl": t.images}),
//   );
// }

// Future<void> uploadTravelActivities(TravelsConstructor t) async {
//   if (t.activities.isEmpty) return;

//   final url = Uri.parse(addTravelActivitiesApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": t.id,
//       "activities": t.activities,
//       "activitiesEn": t.activitiesEn,
//     }),
//   );
// }

// Future<void> uploadAllTravels() async {
//   for (final t in travelsData) {
//     await uploadTravel(t);
//     await uploadTravelImages(t);
//     await uploadTravelActivities(t);
//   }
// }

// // ===============================
// // RESTAURANTS
// // ===============================

// Future<void> uploadRestaurant(ResturntConstructor r) async {
//   final url = Uri.parse(addRestaurantApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": r.id,
//       "title": r.title,
//       "titleEn": r.titleEn,
//       "cityName": r.cityName,
//       "cityNameEn": r.cityNameEn,
//       "imageUrl": r.imageUrl,
//       "latitude": r.location.latitude,
//       "longitude": r.location.longitude,
//       "categoryId": r.categories,
//       "travelType": r.travelType,
//       "travelTypeEn": r.travelTypeEn,
//       "budget": r.budget,
//     }),
//   );
// }

// Future<void> uploadRestaurantActivities(ResturntConstructor r) async {
//   if (r.activities.isEmpty) return;

//   final url = Uri.parse(addRestaurantActivitiesApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": r.id,
//       "activities": r.activities,
//       "activitiesEn": r.activitiesEn,
//     }),
//   );
// }

// Future<void> uploadAllRestaurants() async {
//   for (final r in restaurantData) {
//     await uploadRestaurant(r);
//     await uploadRestaurantActivities(r);
//   }
// }

// // ===============================
// // HOTELS
// // ===============================

// Future<void> uploadHotel(HotelConstructor h) async {
//   final url = Uri.parse(addHotelApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": h.id,
//       "title": h.title,
//       "titleEn": h.titleEn,
//       "cityName": h.cityName,
//       "cityNameEn": h.cityNameEn,
//       "imageUrl": h.imageUrl,
//       "latitude": h.location.latitude,
//       "longitude": h.location.longitude,
//       "categoryId": h.categories,
//       "travelType": h.travelType,
//       "travelTypeEn": h.travelTypeEn,
//       "budget": h.budget,
//     }),
//   );
// }

// Future<void> uploadHotelActivities(HotelConstructor h) async {
//   if (h.activities.isEmpty) return;

//   final url = Uri.parse(addHotelActivitiesApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "hotel_id": h.id,
//       "activities": h.activities,
//       "activitiesEn": h.activitiesEn,
//     }),
//   );
// }

// Future<void> uploadAllHotels() async {
//   for (final h in hotelsData) {
//     await uploadHotel(h);
//     await uploadHotelActivities(h);
//   }
// }

// // ===============================
// // TRIPS
// // ===============================

// Future<void> uploadTrip(TripsConstructor t) async {
//   final url = Uri.parse(addTripApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": t.id,
//       "title": t.title,
//       "titleEn": t.titleEn,
//       "cityName": t.cityName,
//       "cityNameEn": t.cityNameEn,
//       "imageUrl": t.imageUrl,
//       "latitude": t.location.latitude,
//       "longitude": t.location.longitude,
//       "categoryId": t.categories,
//       "travelType": t.travelType,
//       "travelTypeEn": t.travelTypeEn,
//       "budget": t.budget,
//     }),
//   );
// }

// Future<void> uploadTripActivities(TripsConstructor t) async {
//   if (t.activities.isEmpty) return;

//   final url = Uri.parse(addTripActivitiesApi);

//   await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({
//       "id": t.id,
//       "activities": t.activities,
//       "activitiesEn": t.activitiesEn,
//     }),
//   );
// }

// Future<void> uploadAllTrips() async {
//   for (final t in Trips_data) {
//     await uploadTrip(t);
//     await uploadTripActivities(t);
//   }
// }

// // ===============================
// // UPLOAD EVERYTHING
// // ===============================

// Future<void> uploadEverything() async {
//   await uploadAllCategories();
//   await uploadAllTravels();
//   await uploadAllRestaurants();
//   await uploadAllHotels();
//   await uploadAllTrips();
// }

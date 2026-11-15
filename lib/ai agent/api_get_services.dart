import 'dart:convert';

import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/category_constructor.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
import 'package:sudan_tourist_guide/constructros/resturnt_constructor.dart';
import 'package:sudan_tourist_guide/constructros/travels_constructor.dart';
import 'package:sudan_tourist_guide/constructros/trips_constructor.dart';

class ApiGetServices {
  Future<List<CategoryConstructor>> getCategories(String lang) async {
    final response = await http.get(Uri.parse("$getCategoriesApi?lang=$lang"));
    // print(response);

    if (response.statusCode == 200) {
      print(utf8.decode(response.bodyBytes));

      List data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((json) => CategoryConstructor.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }

  Future<List<TravelsConstructor>> getTravels(String lang) async {
    final response = await http.get(Uri.parse("$getTravelsApi?lang=$lang"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => TravelsConstructor.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load travels");
    }
  }

  Future<List<String>> getTravelActivities(String lang, String travelId) async {
    final response = await http.get(
      Uri.parse("$getTravelActivitiesApi?travel_id=$travelId&lang=$lang"),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception("Failed to load travel activities");
    }
  }

  Future<List<String>> getTravelImages(String travelId) async {
    final response = await http.get(
      Uri.parse("$getTravelImagesApi?travel_id=$travelId"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception("Failed to load travel images");
    }
  }

  Future<List<HotelConstructor>> getHotels(String lang) async {
    final response = await http.get(Uri.parse("$getHotelsApi?lang=$lang"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => HotelConstructor.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load hotels");
    }
  }

  Future<List<String>> getHotelActivities(String hotelId, String lang) async {
    final response = await http.get(
      Uri.parse("$getHotelActivitiesApi?hotel_id=$hotelId&lang=$lang"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception("Failed to load hotel activities");
    }
  }

  Future<List<ResturntConstructor>> getRestaurants(String lang) async {
    final response = await http.get(Uri.parse("$getRestaurantsApi?lang=$lang"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => ResturntConstructor.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load restaurants");
    }
  }

  Future<List<String>> getRestaurantActivities(
    String resId,
    String lang,
  ) async {
    final response = await http.get(
      Uri.parse("$getRestaurantActivitiesApi?restaurant_id=$resId&lang=$lang"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception("Failed to load restaurant activities");
    }
  }

  Future<List<TripsConstructor>> getTrips(String lang) async {
    final response = await http.get(Uri.parse("$getTripsApi?lang=$lang"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => TripsConstructor.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load trips");
    }
  }

  Future<List<String>> getTripActivities(String tripId, String lang) async {
    final response = await http.get(
      Uri.parse("$getTripActivitiesApi?trip_id=$tripId&lang=$lang"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data as List)
          .map(
            (e) => lang == "ar"
                ? e['activities'].toString()
                : e['activitiesEn'].toString(),
          )
          .toList();
    } else {
      throw Exception("Failed to load trip activities");
    }
  }
}

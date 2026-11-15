import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';

class RatingService {
  static Future<double> getRating(String placeId) async {
    final response = await http.get(Uri.parse("$getRatings?place_id=$placeId"));

    final data = jsonDecode(response.body);
    return double.parse(data["rating"].toString());
  }

  static Future<void> ratePlace(
    String userId,
    String placeId,
    int rating,
  ) async {
    await http.post(
      Uri.parse(addRatings),
      body: {
        "user_id": userId,
        "place_id": placeId,
        "rating_value": rating.toString(),
      },
    );
  }

  static Future<int> getUserRating(String userId, String placeId) async {
    final response = await http.get(
      Uri.parse("$getUserRatings?user_id=$userId&place_id=$placeId"),
    );

    final data = jsonDecode(response.body);
    return int.parse(data["rating"].toString());
  }
}

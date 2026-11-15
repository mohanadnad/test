import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale("ar");
  Locale get locale => _locale;

  bool isLastPage = false;
  dynamic detailItem;
  String type = '';

  void loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String code = prefs.getString("lang") ?? "ar";
    _locale = Locale(code);
    notifyListeners();
  }

  Future<void> changeLanguage(String code, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lang", code);
    _locale = Locale(code);
    notifyListeners();
  }

  void onBoardingFinshed(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', true);
    isLastPage = index == 3;
    notifyListeners();
  }

  void returnToOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', false);
    notifyListeners();
  }

  bool isLoading = true;
  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchDetails(String type, String id, String lang) async {
    this.type = type;
    final api = ApiGetServices();
    isLoading = true;
    notifyListeners();
    if (type == 'trip') {
      final trips = await api.getTrips(lang);
      detailItem = trips.firstWhere((trip) => trip.id == id);
      // جلب الأنشطة
      final activities = await api.getTripActivities(id, lang);
      detailItem.activities.clear();
      detailItem.activities.addAll(activities);
    } else if (type == 'hotel') {
      final hotels = await api.getHotels(lang);
      detailItem = hotels.firstWhere((h) => h.id == id);
      // جلب الأنشطة
      final activities = await api.getHotelActivities(id, lang);
      detailItem.activities.clear();
      detailItem.activities.addAll(activities);
    } else if (type == 'travel') {
      final travels = await api.getTravels(lang);
      detailItem = travels.firstWhere((t) => t.id == id);
      // جلب الأنشطة
      final activities = await api.getTravelActivities(lang, id);
      detailItem.activities.clear();
      detailItem.activities.addAll(activities);
      // جلب الصور
      final images = await api.getTravelImages(id);
      detailItem.images.clear();
      detailItem.images.addAll(images);
    } else if (type == 'restaurant') {
      final restaurants = await api.getRestaurants(lang);
      detailItem = restaurants.firstWhere((r) => r.id == id);
      // جلب الأنشطة
      final activities = await api.getRestaurantActivities(id, lang);
      detailItem.activities.clear();
      detailItem.activities.addAll(activities);
    }
    isLoading = false;
    notifyListeners();
  }
}

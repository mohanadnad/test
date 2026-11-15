import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';

class FavoritesScreen extends ChangeNotifier {
  List<String> _favoriteIds = [];
  List<dynamic> _favoriteItems = [];

  List<String> get favoriteIds => _favoriteIds;
  List<dynamic> get favoriteItems => _favoriteItems;

  // تحميل IDs من SharedPreferences
  Future<void> loadFavorites(langCode) async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds = prefs.getStringList('favorites') ?? [];
    await _loadFavoriteItemsFromAPI(langCode);
    notifyListeners();
  }

  // حفظ IDs
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favoriteIds);
  }

  // تشغيل/إيقاف المفضلة
  void toggleFavorite(String itemId, String langCode) {
    if (_favoriteIds.contains(itemId)) {
      _favoriteIds.remove(itemId);
    } else {
      _favoriteIds.add(itemId);
    }
    _saveFavorites();
    _loadFavoriteItemsFromAPI(langCode);
    notifyListeners();
  }

  bool isFavorite(String itemId) {
    return _favoriteIds.contains(itemId);
  }

  // جلب العناصر من API
  Future<void> _loadFavoriteItemsFromAPI(String langCode) async {
    final api = ApiGetServices();

    final travels = await api.getTravels(langCode);
    final trips = await api.getTrips(langCode);
    final hotels = await api.getHotels(langCode);
    final restaurants = await api.getRestaurants(langCode);

    _favoriteItems = [
      ...travels.where((item) => _favoriteIds.contains(item.id)),
      ...trips.where((item) => _favoriteIds.contains(item.id)),
      ...hotels.where((item) => _favoriteIds.contains(item.id)),
      ...restaurants.where((item) => _favoriteIds.contains(item.id)),
    ];
  }

  void clearFavorites() {
    _favoriteIds.clear();
    _favoriteItems.clear();
    _saveFavorites();
    notifyListeners();
  }
}

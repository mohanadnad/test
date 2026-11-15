import 'package:sudan_tourist_guide/ai agent/api_get_services.dart';

class TourismRepository {
  TourismRepository._();

  static final TourismRepository instance = TourismRepository._();

  final ApiGetServices _api = ApiGetServices();

  String? _loadedLanguage;
  Future<void>? _loadFuture;

  List<dynamic> hotels = [];
  List<dynamic> restaurants = [];
  List<dynamic> trips = [];
  List<dynamic> travels = [];

  bool get isLoaded => _loadedLanguage != null;

  List<dynamic> get allPlaces => [
        ...hotels,
        ...restaurants,
        ...trips,
        ...travels,
      ];

  Future<void> load(String language) async {
    if (_loadedLanguage == language && allPlaces.isNotEmpty) return;

    // If two chat messages arrive at the same time, both await the same load
    // instead of one returning early with empty lists.
    if (_loadFuture != null) {
      await _loadFuture;
      if (_loadedLanguage == language && allPlaces.isNotEmpty) return;
    }

    final future = _loadInternal(language);
    _loadFuture = future;
    try {
      await future;
    } finally {
      if (identical(_loadFuture, future)) _loadFuture = null;
    }
  }

  Future<void> _loadInternal(String language) async {
    try {
      final results = await Future.wait([
        _api.getHotels(language),
        _api.getRestaurants(language),
        _api.getTrips(language),
        _api.getTravels(language),
      ]);

      hotels = List<dynamic>.from(results[0]);
      restaurants = List<dynamic>.from(results[1]);
      trips = List<dynamic>.from(results[2]);
      travels = List<dynamic>.from(results[3]);
      _loadedLanguage = language;

      print('TourismRepository: loaded ${allPlaces.length} places [$language]');
    } catch (e, stackTrace) {
      print('TourismRepository Error: $e');
      print(stackTrace);
      // Do not destroy valid cached data if a refresh fails.
      rethrow;
    }
  }

  Future<List<dynamic>> getPlaces({
    required String intent,
    required String language,
  }) async {
    await load(language);

    switch (intent) {
      case 'hotel':
        return List<dynamic>.from(hotels);
      case 'restaurant':
        return List<dynamic>.from(restaurants);
      case 'trip':
        return List<dynamic>.from(trips);
      case 'travel':
        return List<dynamic>.from(travels);
      case 'general':
        return allPlaces;
      default:
        return allPlaces;
    }
  }

  List<dynamic> byType(String type) {
    switch (type) {
      case 'hotel': return hotels;
      case 'restaurant': return restaurants;
      case 'trip': return trips;
      case 'travel': return travels;
      default: return allPlaces;
    }
  }

  Future<void> reload(String language) async {
    clear();
    await load(language);
  }

  void clear() {
    hotels = [];
    restaurants = [];
    trips = [];
    travels = [];
    _loadedLanguage = null;
  }
}

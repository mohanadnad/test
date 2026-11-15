import 'package:flutter/material.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';

class SearchEnging extends ChangeNotifier {
  List<dynamic> allSearch = [];
  List<dynamic> filteredSearch = [];
  bool isLoading = false;
  String selectedFilter = "all";

  String selectedTripType = "all";
  String selectedCity = "all";
  Future<void> loadPlaces(String lang) async {
    isLoading = true;
    allSearch.clear();
    filteredSearch.clear();
    notifyListeners();
    final api = ApiGetServices();
    final hotels = await api.getHotels(lang);
    final restaurants = await api.getRestaurants(lang);
    final trips = await api.getTrips(lang);
    final travels = await api.getTravels(lang);
    allSearch = [...hotels, ...restaurants, ...trips, ...travels];
    filteredSearch = allSearch;
    isLoading = false;
    notifyListeners();
    print("LOAD PLACES");
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredSearch = allSearch;
    } else {
      filteredSearch = allSearch.where((place) {
        final title = place.title.toLowerCase();
        final q = query.toLowerCase();
        return title.contains(q);
      }).toList();
    }
    notifyListeners();
  }

  void filterByType(String type) {
    selectedFilter = type;

    print("Filter = $type");
    if (type == "all") {
      filteredSearch = allSearch;
    } else {
      filteredSearch = allSearch.where((place) => place.type == type).toList();
    }
    print("Result Count = ${filteredSearch.length}");
    notifyListeners();
  }

  void filterByTripType(String travelType) {
    selectedTripType = travelType;
    if (travelType == 'all') {
      filteredSearch = allSearch;
    } else {
      filteredSearch = allSearch
          .where((place) => place.travelType == travelType)
          .toList();
    }
    notifyListeners();
  }

  void filterByCity(String city) {
    selectedCity = city;
    if (city == 'all') {
      filteredSearch = allSearch;
    } else {
      filteredSearch = allSearch
          .where((place) => place.cityName == city)
          .toList();
    }
    notifyListeners();
  }

  void filterCombined(String currentLang) {
    filteredSearch = allSearch.where((place) {
      // print("travelTypeEn = ${place.travelTypeEn}");
      // print("selectedTripType = $selectedTripType");
      // print("Language: $currentLang");
      // print("cityNameEn = '${place.cityNameEn}'");
      // print("selectedCity = '$selectedCity'");

      bool matchCity;
      bool matchTravelType;
      if (selectedCity == "all") {
        matchCity = true;
      } else {
        if (currentLang == 'ar') {
          matchCity = place.cityName == selectedCity;
        } else {
          final cityEn = place.cityNameEn?.trim().toLowerCase() ?? "";
          final cityAr = place.cityName?.trim().toLowerCase() ?? "";
          matchCity =
              cityEn.contains(selectedCity.trim().toLowerCase()) ||
              cityAr.contains(selectedCity.trim().toLowerCase());
        }
      }
      if (selectedTripType == 'all') {
        matchTravelType = true;
      } else {
        if (currentLang == 'ar') {
          matchTravelType = place.travelType == selectedTripType;
        } else {
          matchTravelType = place.travelTypeEn
              .toString()
              .trim()
              .toLowerCase()
              .contains(selectedTripType.trim().toLowerCase());
        }
      }
      return matchCity && matchTravelType;
    }).toList();

    notifyListeners();
  }
}

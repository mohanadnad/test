import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/map_enum.dart';

class MapStyleProvider extends ChangeNotifier {
  MapStyle _currentStyle = MapStyle.light;
  MapStyle get currentStyle => _currentStyle;
  Future<void> loadStyle() async {
    final prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt('mapStyle') ?? 0;
    _currentStyle = MapStyle.values[index];
    notifyListeners();
  }

  Future<void> changStyle(MapStyle style) async {
    _currentStyle = style;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('mapStyle', style.index);
    notifyListeners();
  }
}

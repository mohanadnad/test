import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifire extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  bool get isDarkMode => _isDarkMode;
  // ########## for visible button
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  ThemeNotifire() {
    _loadThemeFromPefs();
  }

  void changeAppTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToPrefs();
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }

  Future<void> _loadThemeFromPefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isLoaded = true;
    notifyListeners();
  }

  // ######### visible button function for the password eye
  void toggleVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}

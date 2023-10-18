import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeProvider with ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light;

  AppTheme get currentTheme => _currentTheme;

  ThemeData get themeData {
    return _currentTheme == AppTheme.light
        ? AppStyles.lightTheme
        : AppStyles.darkTheme;
  }

  void toggleTheme() {
    _currentTheme = _currentTheme == AppTheme.light
        ? AppTheme.dark
        : AppTheme.light;
    _isDarkMode = !_isDarkMode; // testing
    notifyListeners();
  }




  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // void toggleTheme() {
  //   _isDarkMode = !_isDarkMode;
  //   notifyListeners();
  // }

}


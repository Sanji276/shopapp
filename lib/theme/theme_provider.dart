import 'package:flutter/material.dart';
import 'package:shopapp/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  //initially the theme is light mode
  ThemeData _themeData = lightMode;

  //getter method to access the theme from other part of code
  ThemeData get themeData => _themeData;

  //setter method to know if darkmode or not
  bool get isDarkMode => _themeData == darkMode;

//setter method to set the new themedata
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}

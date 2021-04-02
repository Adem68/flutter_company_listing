import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({required this.isLightTheme});

  ThemeData get getThemeData => isLightTheme ? lightTheme : darkTheme;

  bool isLightTheme;

  void setThemeData({required bool val}) {
    if (val) {
      isLightTheme = true;
    } else {
      isLightTheme = false;
    }
    notifyListeners();
  }
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.orange,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF000000),
  accentColor: Colors.white,
  accentIconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black54,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.orange,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  int value = 0 ;
  ThemeMode themeMode = ThemeMode.system;


  void toggleTheme(v) {
    switch (value){
      case 0 :
        value = v;
      themeMode = ThemeMode.system;
        break;
      case 1 :
        value = v;
        themeMode = ThemeMode.dark;
        break;
      case 2:
        value = v;
        themeMode = ThemeMode.light;
        break;
    }
    notifyListeners();
  }
}


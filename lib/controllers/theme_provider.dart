import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  int value = 0 ;
  ThemeMode themeMode = ThemeMode.system;



  void toggleTheme(v) {
    switch (value){
      case 0 :
      themeMode = ThemeMode.system;
      value = v;
        break;
      case 1 :
        themeMode = ThemeMode.dark;
        value = v;
        break;
      case 2:
        themeMode = ThemeMode.light;
        value = v;
        break;
    }
    notifyListeners();
  }
}


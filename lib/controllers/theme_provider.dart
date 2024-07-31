import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  int
  value = 0 ;
  ThemeMode themeMode = ThemeMode.system;


  void toggleTheme(v) {
    switch (value){
      case 0 :
        value = v;
        notifyListeners();
        break;
      case 1 :
        value = v;
        notifyListeners();
        break;
      case 2:
        value = v;
        notifyListeners();
        break;
    }
    notifyListeners();
  }
}


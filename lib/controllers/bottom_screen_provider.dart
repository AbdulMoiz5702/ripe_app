import 'package:flutter/material.dart';

import '../views/home_screen/home_screen.dart';

class BottomScreenProvider extends ChangeNotifier {
  int currentTab = 0;
  Widget currentScreen = const HomeScreen();


  void updateScreen(int index, Widget screen) {
    currentTab = index;
    currentScreen = screen;
    notifyListeners();
  }
}
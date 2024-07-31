import 'package:flutter/material.dart';

import '../views/home_screen/home_screen.dart';
import '../views/rider_side_screens/request_screen/main_request_screen.dart';
import '../views/rider_side_screens/rider_chat_screen/rider_chat_screen.dart';
import '../views/rider_side_screens/rider_dashBoard_screen/daskBoard_screen.dart';
import '../views/rider_side_screens/rider_dashBoard_screen/wallet_screen/wallet_screen.dart';
import '../views/user_profile/user_profile_screen.dart';

class BottomScreenProvider extends ChangeNotifier {

  // pessenger bottom screen
  int currentTab = 0;
  Widget currentScreen = const HomeScreen();


  void updateScreen(int index, Widget screen) {
    currentTab = index;
    currentScreen = screen;
    notifyListeners();
  }

  // rider bottom screen

  int riderCurrentIndex = 0;

  var screen = [
    WalletScreen(),
    RiderChatScreen(),
    MainRequestScreen(),
    Container(),
    UserProfileScreen(isUserScreen: true,),
  ];

  changeRiderScreen(int index) {
    riderCurrentIndex = index;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import '../views/RIDER_SIDES_SCREENS/request_screen/main_request_screen.dart';
import '../views/RIDER_SIDES_SCREENS/rider_chat_screen/rider_chat_screen.dart';
import '../views/RIDER_SIDES_SCREENS/rider_dashBoard_screen/wallet_screen/wallet_screen.dart';
import '../views/home_screen/home_screen.dart';
import '../views/notification/notification_screen.dart';
import '../views/scheduled_screen/scheduled_screen.dart';
import '../views/user_profile/user_profile_screen.dart';

class BottomScreenProvider extends ChangeNotifier {

 int mainScreenIndex = 0;

 var allScreen = [
   HomeScreen(),
   ScheduledScreen(),
   HomeScreen(),
   NotificationScreen(),
   UserProfileScreen()
 ];

 changeMainScreen(value) {
   print('Changing screen index to: $value');
   mainScreenIndex = value;
   notifyListeners();
 }

  // rider bottom screen
  int riderCurrentIndex = 0;

  var screen = [
    WalletScreen(),
    RiderChatScreen(),
    MainRequestScreen(),
    NotificationScreen(),
    UserProfileScreen(isUserScreen: true,),
  ];

  changeRiderScreen(int index) {
    riderCurrentIndex = index;
    notifyListeners();
  }
}
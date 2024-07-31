import 'package:flutter/material.dart';

import '../views/rider_side_screens/request_screen/bookings/bookings_screen.dart';
import '../views/rider_side_screens/request_screen/live_request/live_request.dart';


class RiderRideRequestProvider extends ChangeNotifier {

  int currentIndex = 0;

  bool isOnline =false;

  changeValue(value){
    isOnline = value ;
    notifyListeners();
  }

  changeScreen (index){
    currentIndex = index;
    notifyListeners();
  }

  var screens = [
    LiveRequestScreen(),
    BookingsScreen(),
  ];

}
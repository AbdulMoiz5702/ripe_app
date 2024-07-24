

import 'package:flutter/cupertino.dart';

class RoleSelectionProvider extends ChangeNotifier {

  bool passengerSelection = false;
  bool driverSelection = false ;

  selectPassenger(){
    passengerSelection= true;
    driverSelection = false;
    notifyListeners();
  }

  selectDriver(){
    passengerSelection= false;
    driverSelection = true;
    notifyListeners();
  }

}
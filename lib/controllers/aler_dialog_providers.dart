


import 'package:flutter/material.dart';

class AlertDialogProviders extends ChangeNotifier {

  bool tourist = false;
  bool local = false;

  void selectTourist() {
      tourist = true;
      local = false;
      notifyListeners();
  }

  void selectLocal() {
      tourist = false;
      local = true;
      notifyListeners();
  }

}
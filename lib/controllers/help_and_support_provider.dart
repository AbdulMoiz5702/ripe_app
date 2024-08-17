import 'package:flutter/material.dart';


class HelpAndSupportProvider extends ChangeNotifier {

  int index = 0;

  changeIndex(value){
    index  = value ;
    notifyListeners();
  }
}
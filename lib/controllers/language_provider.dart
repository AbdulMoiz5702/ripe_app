import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {

  int indexx = -1;

  changeIndex(index){
    indexx = index;
    notifyListeners();
  }
}
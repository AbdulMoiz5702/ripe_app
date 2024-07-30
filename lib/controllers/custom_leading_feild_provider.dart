import 'package:flutter/material.dart';


class CustomLeadingFieldProvider extends ChangeNotifier {


  bool  showPassword = false ;

  bool  currentPassword = false ;
  bool  newPassword = false ;
  bool  confirmNewPassword = false ;

  changeConfirmNewPasswordIcon(){
    confirmNewPassword =! confirmNewPassword ;
    notifyListeners();
  }

  changeNewPasswordIcon(){
    newPassword =! newPassword ;
    notifyListeners();
  }
  changeCurrentPasswordIcon(){
    currentPassword =! currentPassword ;
    notifyListeners();
  }

  changeSufixIcon(){
    showPassword =! showPassword ;
    notifyListeners();
  }

}
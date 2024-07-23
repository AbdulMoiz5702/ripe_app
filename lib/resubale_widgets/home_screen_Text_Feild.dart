import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';

class HomeScreenTextField extends StatelessWidget {
  HomeScreenTextField({
    this.autoFocus = true,
    required this.controller,
    this.keyBoardType = TextInputType.text,
    this.obscureText = false,
    this.enable = true,
    required this.hint,
    required this.onValidator,
    required this.onFieldSubmittedValue,
    required this.iconPath,
    this.color = textfieldColor,
    this.hintColor = whiteColor,
  });

  final TextEditingController controller;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable;
  final bool autoFocus;
  final String iconPath;
  final Color color;
  final Color hintColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12,right: 2,bottom: 2,top: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: TextFormField(
        enabled: enable,
        autofocus: autoFocus,
        obscureText: obscureText,
        controller: controller,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        style: TextStyle(color: Colors.black,
          fontFamily: 'Nunito Sans',),
        decoration: InputDecoration(
          icon: Image.asset(iconPath, height: 25, width: 25),
          contentPadding: const EdgeInsets.all(8),
          hintText: hint,
          hintStyle: TextStyle(color: hintColor,fontSize: 14.0),
          border: InputBorder.none
        ),
      ),
    );
  }
}

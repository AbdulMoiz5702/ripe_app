import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../consts/images_path.dart';

class CustomLeadingTextField extends StatelessWidget {
  CustomLeadingTextField({
    this.isPassword = false,
    this.autoFocus = false,
    required this.controller,
    required this.keyBoardType,
    required this.obscureText,
    this.enable = true,
    required this.hint,
    required this.onValidator,
    required this.onFieldSubmittedValue,
    this.iconData,
    this.iconPath,
    this.iconDataColor = dividerColor,
    this.isHintChange = false,
    this.leadingText = '',
  });

  final bool isPassword ;
  final TextEditingController controller;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final String leadingText;
  final bool obscureText;
  final bool enable;
  final bool isHintChange;
  final bool autoFocus;
  final Color iconDataColor;
  final IconData? iconData;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
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
        decoration: InputDecoration(suffixIcon: isPassword == true ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(eye, height: 20, width: 20),
        ) : Container(height:0 ,width:0 ,),
          label: smallText(title: isHintChange ?leadingText :hint,textSize: 12.0,weight: FontWeight.w700),
          isDense: true,
          prefixIcon: iconData != null
              ? Icon(iconData, color: iconDataColor,size: 25,)
              : (iconPath != null
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(iconPath!, height: 20, width: 20),
          )
              : null),
          contentPadding: const EdgeInsets.all(8),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

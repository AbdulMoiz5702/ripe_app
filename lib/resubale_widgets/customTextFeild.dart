import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.autoFocus = false,
    required this.controller,
    // required this.focusNode,
    required this.keyBoardType,
    required this.obscureText,
    this.enable = true,
    required this.hint,
    required this.onValidator,
    required this.onFieldSubmittedValue,
    required this.iconData
  });

  final TextEditingController controller;
  // final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool  enable;
  late  bool  autoFocus;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      autofocus: autoFocus,
      obscureText: obscureText,
      controller: controller,
      // focusNode: focusNode,
      onFieldSubmitted: onFieldSubmittedValue,
      validator: onValidator,
      keyboardType: keyBoardType,
      style:TextStyle(color: Colors.black),
      decoration: InputDecoration(
        label: Icon(iconData,color: Colors.black26,),
        contentPadding:const EdgeInsets.all(8),
        hintText: hint,
        hintStyle:TextStyle(color: Colors.black26,),
        border: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

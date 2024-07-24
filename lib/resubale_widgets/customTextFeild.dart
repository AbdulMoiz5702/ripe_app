import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, 
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
  });

  final TextEditingController controller;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable;
  final bool autoFocus;
  final IconData? iconData;
  final String? iconPath;
  final bool isPassword ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        enabled: enable,
        autofocus: autoFocus,
        obscureText: obscureText,
        controller: controller,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        style: const TextStyle(color: Colors.black,
          fontFamily: 'Nunito Sans',),
        decoration: InputDecoration(
          suffixIcon: isPassword == true ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(eye, height: 20, width: 20),
          ) : const SizedBox(height:0 ,width:0 ,),
          isDense: true,
          prefixIcon: iconData != null
              ? Icon(iconData, color: dividerColor,size: 25,)
              : (iconPath != null
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(iconPath!, height: 20, width: 20),
          )
              : null),
          contentPadding: const EdgeInsets.all(8),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black26),
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

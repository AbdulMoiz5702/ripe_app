import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.onTap = null,
    this.showPassword = false,
    this.maxLines = false ,
  });

  final bool isPassword;
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
  final VoidCallback? onTap;
  final bool showPassword;
  final bool maxLines;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height:maxLines == true ? MediaQuery.sizeOf(context).height * 0.15: 45,
      child: TextFormField(
        maxLines: maxLines == true ? 4:1,
          enabled: enable,
          autofocus: autoFocus,
          obscureText: obscureText,
          controller: controller,
          onFieldSubmitted: onFieldSubmittedValue,
          validator: onValidator,
          keyboardType: keyBoardType,
        style:  TextStyle(
          color: theme.primaryColor,
          fontFamily: 'Nunito Sans',
        ),
          decoration: InputDecoration(
            suffixIcon: isPassword == true
                ? GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  showPassword == true ? openEyeSVG : closedEyeSVG,
                  height: 20,
                  width: 20,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            )
                : Container(
              height: 0,
              width: 0,
            ),
            label: smallText(
                title: isHintChange ? leadingText : hint,
                textSize: 12.0,
                weight: FontWeight.w700,
                color: theme.colorScheme.onSecondaryContainer),
            isDense: true,
            prefixIcon: iconData != null
                ? Icon(
              iconData,
              color: iconDataColor,
              size: 25,
            )
                : (iconPath != null
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                iconPath!,
                height: 20,
                width: 20,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            )
                : null),
            contentPadding: const EdgeInsets.all(8),
            hintText: hint,
            hintStyle: TextStyle(color: theme.colorScheme.surfaceBright),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.surfaceBright),
              borderRadius: BorderRadius.circular(maxLines == true ? 10: 30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.surfaceBright),
              borderRadius: BorderRadius.circular(maxLines == true ? 10: 30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.surfaceBright),
              borderRadius: BorderRadius.circular(maxLines == true ? 10: 30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.surfaceBright),
              borderRadius: BorderRadius.circular(maxLines == true ? 10: 30),
            ),
          ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
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
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito Sans',
        ),
        decoration: InputDecoration(
          suffixIcon: isPassword == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    eye,
                    height: 20,
                    width: 20,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          isDense: true,
          prefixIcon: iconData != null
              ? Icon(
                  iconData,
                  color: theme.colorScheme.onSecondaryContainer,
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
            borderSide: BorderSide(color: theme.colorScheme.onSurface),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.onSurface),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.onSurface),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.onSurface),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class OutlineCustomTextField extends StatelessWidget {
  const OutlineCustomTextField({
    super.key,
    this.autoFocus = false,
    required this.controller,
    required this.keyBoardType,
    this.enable = true,
    required this.svgs,
    required this.label,
    required this.hint,
    this.heightSVG = 20.0,
    this.weightSVG = 20.0,
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
  final String label;
  final String svgs;
  final bool enable;
  final double heightSVG;
  final double weightSVG;
  final bool autoFocus;
  final IconData? iconData;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 24.0),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          enabled: enable,
          autofocus: autoFocus,
          controller: controller,
          onFieldSubmitted: onFieldSubmittedValue,
          validator: onValidator,
          keyboardType: keyBoardType,
          style: TextStyle(
            color: theme.primaryColor,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w400
          ),

          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                svgs,
                height: heightSVG,
                width: weightSVG,
                color: theme.colorScheme.primaryFixed,
              ),
            ),
            isDense: true,
            // prefixIcon: iconData != null
            //     ? Icon(iconData, color: theme.colorScheme.onSecondaryContainer,size: 25,)
            //     : (iconPath != null
            //     ? Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset(iconPath!, height: 20, width: 20,color: theme.colorScheme.onSecondaryContainer,),
            // )
            //     : null),
            label: normalText(
              title: label,
              textSize: 12.0,
              color: theme.colorScheme.primaryFixed,
              weight: FontWeight.w700
            ),
            //iconColor
            contentPadding: const EdgeInsets.all(8),
            // hintText: hint,
            // hintStyle:  TextStyle(color: theme.colorScheme.surfaceBright),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,

              ),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:theme.colorScheme.onSurfaceVariant,

              ),
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

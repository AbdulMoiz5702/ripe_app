import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double width;
  final Color color;
  final double height;
  final double borderRadius;
  final double textsize;
  final bool onBoard;
  final Color titleColor;
  final FontWeight weight;
  const CustomButton(
      {required this.title,
      this.weight = FontWeight.w700,
      this.textsize = 14.0,
      required this.onTap,
      this.width = 0.7,
      this.color = buttonColor,
      this.height = 0.06,
      this.borderRadius = 10,
      this.onBoard = true,
      this.titleColor = textButtonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        width: MediaQuery.sizeOf(context).width * width,
        height: MediaQuery.sizeOf(context).height * height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            smallText(
                title: title,
                textSize: textsize,
                color: titleColor,
                weight: weight),
            onBoard == true
                ? CustomSized(
                    width: 0.03,
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            onBoard == true
                ? Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double width;
  final Color color;
  final double height;
  final double borderRadius;
  final bool onBoard;
  const RegisterButton(
      {required this.title,
      required this.onTap,
      this.width = 0.4,
      this.color = buttonColor,
      this.height = 0.06,
      this.borderRadius = 30,
      this.onBoard = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        width: MediaQuery.sizeOf(context).width * width,
        height: MediaQuery.sizeOf(context).height * height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            smallText(
                title: title,
                textSize: 15.0,
                color: textButtonColor,
                weight: FontWeight.w700),
            CustomSized(
              width: 0.03,
            ),
            onBoard == true
                ? Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : Container(
                    height: 1,
                    width: 1,
                  ),
          ],
        ),
      ),
    );
  }
}

class LocationAccessButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isImagePath;
  final VoidCallback onTap;
  final double width;
  final Color color;
  final double height;
  final double borderRadius;
  final double widthbetweentextandicon;
  final double textsize;
  final IconData iconData;
  final Color titleColor;
  final Color tileColor;
  final FontWeight weight;

  const LocationAccessButton(
      {this.widthbetweentextandicon = 0.03,
      required this.title,
      this.textsize = 14.0,
      required this.onTap,
      this.width = 0.7,
      this.color = buttonColor,
      this.height = 0.06,
      this.borderRadius = 10,
        this.tileColor = textButtonColor,
      this.iconData = Icons.place_outlined,
      this.titleColor = textButtonColor,
      this.weight = FontWeight.w400,
      this.imagePath = camera,
      this.isImagePath = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        width: MediaQuery.sizeOf(context).width * width,
        height: MediaQuery.sizeOf(context).height * height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isImagePath == true
                ? SvgPicture.asset(imagePath, )
                : Icon(
                    iconData,
                    color: tileColor,
                  ),
            CustomSized(
              width: widthbetweentextandicon,
            ),
            smallText(
                title: title,
                textSize: textsize,
                color: titleColor,
                weight: weight),
          ],
        ),
      ),
    );
  }
}

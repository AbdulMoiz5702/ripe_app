import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_app/consts/colors.dart';

class CustomButtonNav extends StatelessWidget {
  final int index;
  final String ? imagePath;
  final String title;
  final int currentTab;
  final Function() onPressed;

  CustomButtonNav({
    required this.index,
    required this.imagePath,
    required this.title,
    required this.currentTab,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              SvgPicture.asset(imagePath.toString(),color: currentTab == index ? checkBoxColor : secondaryTextColor,),
            Text(
              title,
              style: TextStyle(
                color: currentTab == index ? checkBoxColor : secondaryTextColor,
                fontSize: 9.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

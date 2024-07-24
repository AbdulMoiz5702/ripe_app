import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class HomeScreenServicesButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const HomeScreenServicesButton({
    required this.imagePath,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomLeft,
        height: MediaQuery.sizeOf(context).height * 0.12,
        width: MediaQuery.sizeOf(context).width * 0.4,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: largeText(textSize: 14.0,title: text,color: whiteColor)
        ),
      ),
    );
  }
}

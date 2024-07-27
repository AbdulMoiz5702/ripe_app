import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 50,
      width: 50,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.secondary,
      ),
      child: const Center(child: Image(image: AssetImage(bottomArrow)),),
    );
  }
}

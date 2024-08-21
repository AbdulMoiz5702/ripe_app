import 'package:flutter/material.dart';
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
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary.withOpacity(0.15),
            offset: Offset(0.2, 1), // Shadow position: x, y
            blurRadius: 3, // Blur intensity
            spreadRadius: 3 , // Spread of the shadow
          ),
        ]
      ),
      child:  Center(child: Image(image: AssetImage(bottomArrow,),color: theme.colorScheme.inversePrimary,),),
    );
  }
}

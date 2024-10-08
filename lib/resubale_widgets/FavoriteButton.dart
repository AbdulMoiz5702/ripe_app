import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../consts/colors.dart';



class FavoriteButton extends StatelessWidget {
  final String title ;
  final String imagePath;
  final VoidCallback  onTap ;
  const FavoriteButton({super.key, required this.title,required this.imagePath,required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.06,
        width: MediaQuery.sizeOf(context).width * 0.45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: textFieldHintColor.withOpacity(0.08),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagePath),color: theme.colorScheme.primary,),
            largeText(textSize: 14.0,title: ' $title',color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';

import '../consts/colors.dart';


class CustomLeading extends StatelessWidget {
  final bool isHome ;
  final IconData iconData ;
  const CustomLeading({super.key, this.isHome = false,this.iconData = Icons.arrow_back});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: (){ Navigator.pop(context); },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: theme.scaffoldBackgroundColor,
          border: isHome == true ? Border.all(color: theme.colorScheme.onSecondaryContainer) : null,
        ),
        child: Center(child: Icon(iconData,color: theme.primaryColor,),),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final VoidCallback onTap;
  const NotificationButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: theme.scaffoldBackgroundColor,
            border :Border.all(color: theme.scaffoldBackgroundColor)
        ),
        child:SvgPicture.asset(bellSimpleSvg,height: 30,width: 30,color:  theme.primaryColor,)),
    );
  }
}

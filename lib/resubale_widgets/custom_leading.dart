import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';

import '../consts/colors.dart';


class CustomLeading extends StatelessWidget {
  final bool isHome ;
  final IconData iconData ;
  final double doublevalue ;
  const CustomLeading({super.key, this.isHome = false,this.iconData = Icons.arrow_back, this.doublevalue = 10});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ Navigator.pop(context); },
      child: Container(
        margin:  EdgeInsets.all(doublevalue),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: isHome == true ? Border.all(color: otpColor) : null,
        ),
        child: Center(child: SvgPicture.asset('assets/svg_pictures/ArrowLeft.svg'),),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final VoidCallback onTap;
  const NotificationButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, 
            border :Border.all(color: otpColor)
        ),
        child:SvgPicture.asset(bellSimpleSvg,height: 30,width: 30,)),
    );
  }
}

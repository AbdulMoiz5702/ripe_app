import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';






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
          border: isHome == true ? Border.all(color:theme.colorScheme.errorContainer.withOpacity(0.2)) : null,
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

class CustomLeadingSecond extends StatelessWidget {
  final bool isHome ;
  final bool isSecondary ;
  final IconData iconData ;
  final double  padding ;
  const CustomLeadingSecond({super.key, this.isHome = false,this.iconData = Icons.arrow_back,this.isSecondary = false,this.padding = 5});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: (){ Navigator.pop(context); },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: isSecondary == true ? theme.colorScheme.surfaceContainerHighest :theme.scaffoldBackgroundColor,
          border: isHome == true ? Border.all(color: theme.dividerColor) : null,
        ),
        child: Center(child: Padding(
          padding:  EdgeInsets.all(padding.toDouble()),
          child: Icon(iconData,color: theme.primaryColor,size: 20,),
        ),),
      ),
    );
  }
}

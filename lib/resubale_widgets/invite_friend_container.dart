import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class HomeScreenInviteButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final String smallOne;
  final String smallSecond;
  final VoidCallback onTap;

  const HomeScreenInviteButton({
    required this.imagePath,
    required this.text,
    required this.onTap,
    required this.smallOne,
    required this.smallSecond,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: MediaQuery.sizeOf(context).height * 0.21,
        width: MediaQuery.sizeOf(context).width * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: theme.colorScheme.primaryContainer,
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.scaffoldBackgroundColor,
                  ),
                  child:SvgPicture.asset(imagePath,color: theme.colorScheme.secondary)
                ),
                const CustomSized(height: 0.01,),
                largeText(textSize: 18.0,title: text,color: theme.colorScheme.secondaryContainer),
                const CustomSized(height: 0.009,),
                smallText(title: smallOne,textSize: 11.0,color: theme.colorScheme.secondaryContainer),
                const CustomSized(height: 0.009,),
                smallText(title: smallSecond,textSize: 11.0,color: theme.colorScheme.secondaryContainer)
              ],
            )
        ),
      ),
    );
  }
}

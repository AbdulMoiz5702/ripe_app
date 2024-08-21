import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class SignupStepsCount extends StatelessWidget {
  final String title ;
  const SignupStepsCount({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      height: 40,
      width: MediaQuery.sizeOf(context).width * 0.13,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          smallText(title: title,color: theme.colorScheme.primary,textSize: 14.0,weight: FontWeight.w500),
          smallText(title: '/5',color: theme.colorScheme.onSecondaryContainer,textSize: 13.0,weight: FontWeight.w500),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../resubale_widgets/CustomButton.dart';
import '../resubale_widgets/Custom_Sized.dart';
import '../resubale_widgets/text_widgets.dart';



class RiderStatusConfirmation extends StatelessWidget {
  const RiderStatusConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSized(height: 0.02),
          largeText(
              title: 'Do you want to go offline?',
              textSize: 18.0,
              color: theme.primaryColor
          ),
          CustomSized(height: 0.02),
          CustomButton(
            onBoard: false,
            width: 1,
            title: 'No, I want to offer rides',
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: 30,
          ),
          CustomSized(height: 0.02),
          SecondaryCustomButton( onBoard: false,
            color: theme.colorScheme.surfaceContainerHighest,
            titleColor: theme.colorScheme.primary,
            width: 1,
            title: 'Yes, I\'ll pick rides later',
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: 30,)
        ],
      ),
    );
  }
}

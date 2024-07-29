import 'package:flutter/material.dart';

import '../resubale_widgets/CustomButton.dart';
import '../resubale_widgets/text_widgets.dart';


class RepostChatAlertDialog extends StatelessWidget {
  const RepostChatAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  AlertDialog(
      titlePadding:  EdgeInsets.only(left: 20, top: 20.0, right: 20.0),
      contentPadding: EdgeInsets.only(left: 20, top: 4.0, right: 20.0, bottom: 6.0),
      actionsPadding:  EdgeInsets.only(left: 0, top: 4.0, right: 20.0, bottom: 15.0),
      backgroundColor: theme.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
      ),

      title: largeText(
          title: 'Report Chat',
          textSize: 18.0,
          color: theme.primaryColor
      ),
      content: smallText(
          title: 'Are you sure you want to report this chat?',
          color: theme.colorScheme.onSecondaryContainer),

      actions: <Widget>[
        SecondaryCustomButton(
          title: 'Cancel',
          onBoard: false,
          onTap: () {},
          titleColor: theme.primaryColor,
          width: 0.2,
          borderRadius: 25.0,
          textsize: 15,
          weight: FontWeight.w700,
          color: theme.colorScheme.surfaceContainerHighest,
        ),
        SecondaryCustomButton(
          title: 'Report Chat',
          onBoard: false,
          borderRadius: 25.0,
          titleColor: theme.colorScheme.inversePrimary,
          onTap: () {},
          width: 0.3,
          textsize: 15,
          weight: FontWeight.w700,
          color: theme.primaryColor,
        ),
      ],

    );
  }
}
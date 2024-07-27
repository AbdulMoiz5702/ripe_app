import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class NotificationListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationListTile({super.key, 
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          smallText(
            title: title,
            color: theme.primaryColor
          ),
          Transform.scale(
            scale: 0.6, // Adjust this value to change the size of the switch
            child: CupertinoSwitch(
              trackColor: theme.colorScheme.surfaceContainerHighest,
              value: value,
              onChanged: onChanged,
              activeColor: theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}



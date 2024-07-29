import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';

import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/notification_list_tile.dart';
import '../../resubale_widgets/text_widgets.dart';


class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeading(
          isHome: true,
        ),
        title: largeText(title: 'Notification references', textSize: 20.0,color: theme.primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSized(height: 0.02,),
            smallText(title: 'RIDER MESSAGES',weight:FontWeight.w700,color: theme.colorScheme.onSecondaryContainer ),
            NotificationListTile(title: 'Push Notification',value: true,onChanged: (value){},),
            NotificationListTile(title: 'Emails',value: true,onChanged: (value){},),
            const CustomSized(height: 0.02,),
            smallText(title: 'PAYMENT NOTIFICATIONS',weight:FontWeight.w700,color:theme.colorScheme.onSecondaryContainer),
            NotificationListTile(title: 'Push Notification',value: true,onChanged: (value){},),
            NotificationListTile(title: 'Emails',value: true,onChanged: (value){},),
            NotificationListTile(title: 'SMS',value: true,onChanged: (value){},),
            const CustomSized(height: 0.02,),
            smallText(title: 'SCHEDULED RIDES ',weight:FontWeight.w700,color:theme.colorScheme.onSecondaryContainer),
            NotificationListTile(title: 'Push Notification',value: true,onChanged: (value){},),
            NotificationListTile(title: 'Emails',value: true,onChanged: (value){},),
            const CustomSized(height: 0.02,),
            smallText(title: 'ONGOING RIDES',weight:FontWeight.w700,color:theme.colorScheme.onSecondaryContainer),
            NotificationListTile(title: 'Push Notification',value: true,onChanged: (value){},),
            NotificationListTile(title: 'Emails',value: true,onChanged: (value){},),

          ],
        ),
      ),
    );
  }
}

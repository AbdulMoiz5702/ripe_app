import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';

import '../../controllers/notiication_provider.dart';
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
            Consumer<NotificationProvider>(builder: (context,provider,_){
              return Column(
                children: [
                  NotificationListTile(title: 'Push Notification',value: provider.riderPush,onChanged: (value){
                    provider.changeValue(value, 'riderPush');
                  },),
                  NotificationListTile(title: 'Emails',value: provider.riderEmail,onChanged: (value){
                    provider.changeValue(value, 'riderEmail');
                  },),
                ],
              );
            }),
            const CustomSized(height: 0.02,),
            smallText(title: 'PAYMENT NOTIFICATIONS',weight:FontWeight.w700,color:theme.colorScheme.onSecondaryContainer),
            Consumer<NotificationProvider>(builder: (context,provider,_){
              return Column(
                children: [
                  NotificationListTile(title: 'Push Notification',value: provider.paymentPush,onChanged: (value){
                    provider.changeValue(value, 'paymentPush');
                  },),
                  NotificationListTile(title: 'Emails',value: provider.paymentEmail,onChanged: (value){
                    provider.changeValue(value, 'paymentEmail');
                  },),
                  NotificationListTile(title: 'SMS',value: provider.paymentSMS,onChanged: (value){
                    provider.changeValue(value, 'paymentSMS');
                  },),
                ],
              );
            }),
            const CustomSized(height: 0.02,),
            smallText(title: 'SCHEDULED RIDES ',weight:FontWeight.w700,color:theme.colorScheme.onSecondaryContainer),
            Consumer<NotificationProvider>(builder: (context,provider,_){
              return Column(
                children: [
                  NotificationListTile(title: 'Push Notification',value: provider.schedulePush,onChanged: (value){
                    provider.changeValue(value, 'schedulePush');
                  },),
                  NotificationListTile(title: 'Emails',value: provider.scheduleEmail,onChanged: (value){
                    provider.changeValue(value, 'scheduleEmail');
                  },),
                ],
              );
            }),

            const CustomSized(height: 0.02,),
            smallText(title: 'ONGOING RIDES',weight:FontWeight.w700,color:theme.colorScheme.onSecondaryContainer),
            Consumer<NotificationProvider>(builder: (context,provider,_){
              return Column(
                children: [
                  NotificationListTile(title: 'Push Notification',value: provider.onGoingPush,onChanged: (value){
                    provider.changeValue(value, 'onGoingPush');
                  },),
                  NotificationListTile(title: 'Emails',value: provider.onGoingEmails,onChanged: (value){
                    provider.changeValue(value, 'onGoingEmails');
                  },),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

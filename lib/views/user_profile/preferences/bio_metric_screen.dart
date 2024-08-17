import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/notification_list_tile.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class BioMetricScreen extends StatelessWidget {
  const BioMetricScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Biometric login',textSize: 20.0,color: theme.primaryColor),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationListTile(title: 'Use touch ID for biometric login', value: true, onChanged: (value){}),

          ],
        ),
      ),
    );
  }
}

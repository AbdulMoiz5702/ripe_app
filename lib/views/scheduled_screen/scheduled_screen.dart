import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/ride_details_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class ScheduledScreen extends StatelessWidget {
  const ScheduledScreen();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Scheduled rides', textSize: 20.0,color:theme.primaryColor ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.2', color: theme.colorScheme.shadow, month: 'Current rides', showContainerColor: true, showInProgress: true, showborderLine: true,),
            RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: theme.scaffoldBackgroundColor, month: 'May',),
            RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: theme.scaffoldBackgroundColor, month: '',),
            RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: theme.scaffoldBackgroundColor, month: '',),
            RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: theme.scaffoldBackgroundColor, month: 'Jan',)
          ],
        ),
      ),
    );
  }
}

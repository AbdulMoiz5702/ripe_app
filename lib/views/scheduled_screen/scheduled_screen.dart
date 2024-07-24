import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/ride_details_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class ScheduledScreen extends StatelessWidget {

  final String title;

  const ScheduledScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Notifications', textSize: 20.0, weight: FontWeight.w700),
        // actions: [
        //   Tooltip(
        //     decoration: BoxDecoration(
        //         color: buttonColor,
        //         borderRadius: BorderRadius.circular(8)
        //     ),
        //     key: _toolTipKey,
        //     message: 'Customize your notifications',
        //     textStyle:  const TextStyle(
        //       fontSize: 14,
        //       fontWeight: FontWeight.w400,
        //       color: whiteColor,
        //       fontFamily:'Nunito Sans',
        //     ),
        //     child: IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           CupertinoPageRoute(
        //             builder: (context) => const NotificationSettingsScreen(),
        //           ),
        //         );
        //       },
        //       icon: const Icon(Icons.settings, color: iconColor),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.2', color: progressrideCOlor, month: 'Current rides', showContainerColor: true, showInProgress: true, showborderLine: true,),
          RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: secondaryBackGround, month: 'May',),
        RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: secondaryBackGround, month: '',),
        RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: secondaryBackGround, month: '',),
        RideDetailsWidget(name: '4 May, 2024, 12:15PM',price: '2.5', color: secondaryBackGround, month: 'Jan',)

          ],
        ),
      ),
    );
  }
}

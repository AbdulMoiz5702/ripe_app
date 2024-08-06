import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../../controllers/Rider_ride_process_provider.dart';




class RiderInProgressBottomSheet extends StatelessWidget {
  const RiderInProgressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<RiderRideProcessProvider>(context,listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.24,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:  theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
      ),
      child: Column(
        children: [
          BottomSheetsLeadings(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                largeText(title: '30min',color: theme.colorScheme.secondary,textSize: 32.0,weight: FontWeight.w800),
                CustomSized(height: 0.01,),
                smallText(title: '5miles • 12:56PM',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.03,),
                SecondaryCustomButton(title: 'Complete ride', onTap: (){
                  controller.openRideCompletedBottomSheet(context: context);
                },width: 1,borderRadius: 30,iconData: Icons.check_circle_outline_rounded,color: theme.primaryColor,
                  titleColor: theme.colorScheme.inversePrimary,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


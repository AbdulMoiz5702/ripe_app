import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/chat_rider_passenger_listTile.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../../controllers/Rider_ride_process_provider.dart';
import '../../../../resubale_widgets/location_sop_points.dart';



class RiderArrivedBottomSheets extends StatelessWidget {
  const RiderArrivedBottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<RiderRideProcessProvider>(context,listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.7,
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
                largeText(title: '05:00',color: theme.primaryColor,textSize: 32.0,weight: FontWeight.w800),
                CustomSized(height: 0.01,),
                smallText(title: 'You’ve arrived at pick-up location',color: theme.colorScheme.onSecondaryContainer,weight: FontWeight.w700),
                CustomSized(height: 0.02,),
                ChatRiderListTIle(theme: theme),
                CustomSized(height: 0.01,),
                DottedDivider(),
                CustomSized(height: 0.02,),
                Align(alignment: Alignment.centerLeft,child: smallText(title: 'Ride fare',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer,)),
                CustomSized(height: 0.009,),
                Align(alignment: Alignment.centerLeft,child: smallText(title: '\$100',color: theme.primaryColor,weight: FontWeight.w700)),
                CustomSized(height: 0.02,),
                DottedDivider(),
                CustomSized(height: 0.02,),
                Align(alignment:Alignment.centerLeft,child: smallText(title: 'Route details',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer)),
                CustomSized(height: 0.01,),
                LocationStopPonits(theme: theme),
                CustomSized(height: 0.03,),
                CustomButton(title: 'Start ride', onTap: (){
                  Navigator.pop(context);
                  controller.openRiderInProgressBottomSheet(context: context);
                },width: 1,borderRadius: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


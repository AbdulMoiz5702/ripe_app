import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/Rider_ride_process_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/chat_rider_passenger_listTile.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';



class RiderComingBottomSheet extends StatelessWidget {
  const RiderComingBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<RiderRideProcessProvider>(context,listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.53,
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
                smallText(title: 'Estimated pick-up time',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer,),
                CustomSized(height: 0.025,),
                largeText(title: '10min',color: theme.colorScheme.secondary,textSize: 20.0,),
                CustomSized(height: 0.01,),
                smallText(title: '5miles • 12:56PM',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.02,),
                DottedDivider(),
                CustomSized(height: 0.01,),
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
                ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.circle_outlined,color: theme.colorScheme.secondary,),
                      CustomSized(width: 0.02,height: 0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          smallText(title: 'Pick-up location',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer,),
                          CustomSized(height: 0.005,width: 0,),
                          smallText(title: 'Pick-up location',color: theme.colorScheme.onSecondaryContainer,weight: FontWeight.w700),
                          CustomSized(height: 0.005,width: 0,),
                          smallText(title: 'F-8 - Islamabad, The Centaurus Mall',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer,),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomSized(height: 0.02,),
                CustomButton(title: 'Confirm my arrival', onTap: (){
                  controller.openRiderArrivedBottomSheet(context: context);
                },onBoard: true,width: 1,borderRadius: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

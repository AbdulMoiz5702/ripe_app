import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../../resubale_widgets/location_sop_points.dart';
import '../../../controllers/pessenger_ride_process_provider.dart';
import '../pessenger_rate_rider_screen/pessenger_rate_rider_screen.dart';




class PessengerRideCompletedBottomSheet extends StatelessWidget {
  const PessengerRideCompletedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<PessengerRideProcessProvider>(context,listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.85,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:  theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
      ),
      child: Column(
        children: [
          BottomSheetsLeadings(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSized(height: 0.01,),
                largeText(title: 'Thanks for riding',color: theme.primaryColor,textSize: 20.0,weight: FontWeight.w800),
                CustomSized(height: 0.01,),
                smallText(title: 'We hope you enjoyed your ride this morning.',color: theme.colorScheme.onSecondaryContainer,weight: FontWeight.w700),
                CustomSized(height: 0.02,),
                Container(height: 1,color: theme.dividerColor,),
                CustomSized(height: 0.015,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallText(title: 'Ride fare',color: theme.colorScheme.onSecondaryContainer,),
                        smallText(title: '\$100',color: theme.primaryColor,weight: FontWeight.w700),
                      ],
                    ),
                    CustomSized(height: 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallText(title: 'Pickup from airport',color: theme.colorScheme.onSecondaryContainer,),
                        smallText(title: '\$10',color: theme.primaryColor,weight: FontWeight.w700),
                      ],
                    ),
                  ],
                ),
                CustomSized(height: 0.015,),
                DottedDivider(),
                CustomSized(height: 0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallText(title: 'Total fare',color: theme.primaryColor,weight: FontWeight.w700,textSize: 18.0),
                    smallText(title: '\$113',color: theme.primaryColor,weight: FontWeight.w700,textSize: 18.0),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 20,
                      ),
                      CustomSized(
                        width: 0.02,
                      ),
                      Expanded(
                        child: Text(
                          'Fare has been deducted from your default payment account.',
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.onSecondaryContainer,
                            fontFamily: 'Nunito Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 1,color: theme.dividerColor,),
                CustomSized(height: 0.01,),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: MediaQuery.sizeOf(context).height * 1,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                CustomSized(height: 0.02,),
                Align(alignment: Alignment.centerLeft,child: smallText(title: 'Route details',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer,)),
                CustomSized(height: 0.01,),
                LocationStopPonits(theme: theme),
                CustomSized(height: 0.02,),
                SecondaryAccessButton(
                    borderRadius: 30,
                    width: 1,
                    titleColor: theme.primaryColor,
                    color: theme.colorScheme.surfaceContainerHighest,
                    title: 'Report issue', onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (contex)=> PessengerRateRiderScreen()));
                  // controller.openRepostIssueBottomSheet(context: context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


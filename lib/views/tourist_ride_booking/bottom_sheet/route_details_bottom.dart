import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/alert_dialogs/selection_alert_dialg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/notification_list_tile.dart';
import 'package:ride_app/views/tourist_ride_booking/rider_request_screen.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/location_sop_points.dart';
import '../../../resubale_widgets/text_widgets.dart';

class RouteDetailsBottom extends StatelessWidget {
  const RouteDetailsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<ScheduleRideProvider>(context,listen: false);
    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetsLeadings(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSized(
                  height: 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    largeText(
                      title: 'Route details',
                      textSize: 20.0,
                      color: theme.primaryColor,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            advanceCalender,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                          smallText(
                            title: ' Now ',
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomSized(
                  height: 0.02,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    largeText(
                        textSize: 12.0,
                        title: 'Ride fair',
                        color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(
                      height: 0.002,
                    ),
                    largeText(
                        textSize: 50.0,
                        title: '\$142',
                        color: theme.primaryColor,
                        weight: FontWeight.w800),
                  ],
                ),
                CustomSized(
                  height: 0.02,
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 20,
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                      CustomSized(
                        width: 0.02,
                      ),
                      Expanded(
                        child: Text(
                          'Fare can be increased/decreased in a range of \$10-13 from recommended fare.',
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
                GestureDetector(
                  onTap: (){
                    AlertDialogClass().showFareComparisonAlertDialog(context);
                  },
                  child: largeText(
                      title: 'Compare fare with our competitors',
                      textSize: 13.0,
                      weight: FontWeight.w700,
                      color: theme.colorScheme.secondary),
                ),
                CustomSized(
                  height: 0.02,
                ),
                Consumer<ScheduleRideProvider>(builder: (context, provider, _) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '  Tap to view route details',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: theme.primaryColor,
                              fontFamily: 'Nunito Sans',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              provider.changeValue();
                            },
                            icon: Icon(
                              provider.isExpanded == true
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_rounded,
                              size: 20,
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      if (provider.isExpanded == true)
                        LocationStopPonits(theme: theme),
                    ],
                  );
                }),
                Consumer<ScheduleRideProvider>(builder: (context,provider,_){
                  return NotificationListTile(
                      title: 'Pre-approved ride request',
                      value: provider.preRide,
                      onChanged: (value) {
                        provider.changePreRide(value);
                      });
                }),
                Divider(
                  thickness: 2,
                  color: theme.dividerColor,
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
                          'You can take the help of our AI bot to reroute your path to save fare.',
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
                Consumer<ScheduleRideProvider>(builder: (context,provider,_){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          provider.openCreditCardBottomSheet(context: context);
                        },
                        child:  Row(
                          children: [
                            Icon(
                              Icons.credit_card_outlined,
                              size: 20,
                              color: theme.colorScheme.secondary,
                            ),
                            CustomSized(
                              width: 0.02,
                            ),
                            Text(
                              'Credit card',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: theme.primaryColor,
                                fontFamily: 'Nunito Sans',
                              ),
                            ),
                            CustomSized(
                              width: 0.02,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          provider.openAiSuggestedRouteBottomSheet(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: theme.colorScheme.onSecondaryContainer),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(provider.iconsPath,color: theme.primaryColor,),
                              smallText(
                                  title: provider.title,
                                  weight: FontWeight.w700,
                                  color: theme.primaryColor)
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
                CustomSized(
                  height: 0.02,
                ),
                CustomButton(
                  title: 'Search for riders',
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> RiderRequestScreen()));
                  },
                  onBoard: false,
                  borderRadius: 30,
                  width: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

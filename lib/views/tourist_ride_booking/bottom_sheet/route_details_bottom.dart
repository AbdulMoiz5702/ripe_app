import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/alert_dialogs/selection_alert_dialg.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/notification_list_tile.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/text_widgets.dart';

class RouteDetailsBottom extends StatelessWidget {
  const RouteDetailsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ScheduleRideProvider>(context,listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                color: dividerColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
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
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box,
                            color: dividerColor,
                          ),
                          smallText(
                            title: ' Now ',
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: dividerColor,
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
                        color: secondaryTextColor),
                    CustomSized(
                      height: 0.002,
                    ),
                    largeText(
                        textSize: 50.0,
                        title: '\$142',
                        color: primaryTextColor,
                        weight: FontWeight.w800),
                  ],
                ),
                CustomSized(
                  height: 0.02,
                ),
                const Padding(
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
                          'Fare can be increased/decreased in a range of \$10-13 from recommended fare.',
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w400,
                            color: secondaryTextColor,
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
                      color: checkBoxColor),
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
                              color: primaryTextColor,
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
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      if (provider.isExpanded == true)
                        Container(
                          height: 200, // Adjust the height as needed
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 2,
                                      height: MediaQuery.sizeOf(context).height * 0.05,
                                      color: dividerColor,
                                      margin: EdgeInsets.only(left: 10,bottom: 5),
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            index == 0
                                                ? Icons.brightness_1
                                                : index == 1
                                                    ? Icons
                                                        .brightness_1_outlined
                                                    : Icons
                                                        .brightness_1_outlined,
                                            color: index == 0
                                                ? redColor
                                                : index == 1
                                                    ? redColor
                                                    : checkBoxColor,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  largeText(title: 'The Centaurus Mall', textSize: 14.0),
                                                  CustomSized(height: 0.005,),
                                                  smallText(title: 'F-8 - Islamabad, The Centaurus Mall', textSize: 11.0),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
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
                  color: dividerColor,
                ),
                const Padding(
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
                            color: secondaryTextColor,
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
                        child: const Row(
                          children: [
                            Icon(
                              Icons.credit_card_outlined,
                              size: 20,
                              color: checkBoxColor,
                            ),
                            CustomSized(
                              width: 0.02,
                            ),
                            Text(
                              'Credit card',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: primaryTextColor,
                                fontFamily: 'Nunito Sans',
                              ),
                            ),
                            CustomSized(
                              width: 0.02,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                              color: blackColor,
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
                            border: Border.all(color: otpColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(provider.iconsPath),
                              smallText(
                                  title: provider.title,
                                  weight: FontWeight.w700,
                                  color: primaryTextColor)
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
                    Navigator.pop(context);
                    controller.openSearchForRiderBottom(context);
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../alert_dialogs/selection_alert_dialg.dart';
import '../../../consts/colors.dart';
import '../../../controllers/shedule_ride_provider.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/notification_list_tile.dart';
import '../../../resubale_widgets/text_widgets.dart';


class SearchForRiderBottom extends StatelessWidget {
  const SearchForRiderBottom({super.key});

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: largeText(
                    title: 'Searching for riders',
                    textSize: 20.0,
                  ),
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
                CustomSized(
                  height: 0.02,
                ),
                CustomButton(
                  titleColor: redColor,
                  title: 'Cancel search for ride',
                  onTap: () {
                    controller.openSearchDriverCancelConformationSheet(context);
                  },
                  onBoard: false,
                  borderRadius: 30,
                  width: 1,
                  color: redButtonColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/text_widgets.dart';


class SearchDriverCancelConformationSheet extends StatelessWidget {
  const SearchDriverCancelConformationSheet({super.key});

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
                largeText(
                  title: 'Do you want to cancel the request?',
                  textSize: 20.0,
                  color: theme.primaryColor
                ),
                CustomSized(
                  height: 0.02,
                ),
                CustomButton(
                  title: 'Keep searching',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  onBoard: false,
                  borderRadius: 30,
                  width: 1,
                ),
                CustomSized(
                  height: 0.02,
                ),
                SecondaryCustomButton(
                  titleColor: theme.primaryColor,
                  title: 'Cancel request',
                  onTap: () {
                    controller.openRouteDetailsBottomBottomSheet(context: context);
                  },
                  onBoard: false,
                  borderRadius: 30,
                  width: 1,
                  color: theme.colorScheme.surfaceContainerHighest,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

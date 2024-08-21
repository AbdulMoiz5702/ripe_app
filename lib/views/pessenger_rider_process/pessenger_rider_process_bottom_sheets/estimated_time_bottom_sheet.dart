import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../controllers/pessenger_ride_process_provider.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/bottom_sheets_leading.dart';
import '../../../resubale_widgets/location_sop_points.dart';


class EstimatedTimeBottomSheet extends StatelessWidget {
  const EstimatedTimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Provider.of<PessengerRideProcessProvider>(context,listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                smallText(title: 'Estimated time',textSize: 11.0,color: theme.colorScheme.onSecondaryContainer),
                CustomSized(
                  height: 0.015,
                ),
                GestureDetector(
                  onTap: (){
                    controller.openPessengerRideCompletedBottomSheet(context: context);
                  },
                    child: largeText(textSize: 20.0,title: '30min',color: theme.colorScheme.secondary)),
                CustomSized(
                  height: 0.015,
                ),
                smallText(title: '12miles • 12:56PM',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(
                  height: 0.015,
                ),
                Consumer<PessengerRideProcessProvider>(builder: (context, provider, _) {
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
                CustomSized(
                  height: 0.015,
                ),
                SecondaryAccessButton(
                    borderRadius: 30,
                    width: 1,
                    titleColor: theme.primaryColor,
                    color: theme.colorScheme.surfaceContainerHighest,
                    title: 'Emergency assistance', onTap: (){
                    controller.openEmergencyAssistanceBottomSheet(context: context);

                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

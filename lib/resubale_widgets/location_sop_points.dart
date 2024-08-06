import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../consts/colors.dart';
import 'Custom_Sized.dart';


class LocationStopPonits extends StatelessWidget {
  const LocationStopPonits({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.22,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                index == 0 ? Container(height: 0,width: 0,) : Container(
                  width: 2,
                  height: MediaQuery.sizeOf(context).height * 0.04,
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
                            ? theme.colorScheme.secondaryFixed
                            : index == 1
                            ? theme.colorScheme.secondaryFixed
                            : theme.colorScheme.secondary,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              largeText(title: 'The Centaurus Mall', textSize: 14.0,color: theme.primaryColor),
                              CustomSized(height: 0.005,),
                              smallText(title: 'F-8 - Islamabad, The Centaurus Mall', textSize: 11.0,color: theme.colorScheme.onSecondaryContainer),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
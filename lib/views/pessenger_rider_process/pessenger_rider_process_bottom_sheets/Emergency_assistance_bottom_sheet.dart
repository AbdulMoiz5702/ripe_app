import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';

import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';


class EmergencyAssistanceBottomSheet extends StatelessWidget {
  const EmergencyAssistanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.6,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: theme.scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSized(width: 0.15,height: 0,),
              largeText(
                  title: 'Emergency assistance',
                  textSize: 18.0,
                  color: theme.primaryColor),
              CustomSized(width: 0.04,height: 0,),
              CustomLeadingSecond(
                iconData: Icons.close,
                isSecondary: true,
                padding:  12,
              ),
            ],
          ),
          CustomSized(height: 0.02,),
          DottedDivider(),
          CustomSized(height: 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.directions_car_outlined,color: theme.colorScheme.secondary,),
              CustomSized(
                width: 0.02,
              ),
              smallText(title: ' Vehicle details',color: theme.colorScheme.onSecondaryContainer),

            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.0),
            child: Expanded(
              flex: 1,
              child: Text(
                'Honda - Grey Corolla, RIR-19 -467',
                style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 0.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: theme.primaryColor,
                  fontFamily: 'Nunito Sans',
                ),
              ),
            ),
          ),
          CustomSized(height: 0.02,),
          DottedDivider(),
          CustomSized(height: 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                currentLocationSVG,
                color: theme.colorScheme.secondary,
              ),
              CustomSized(
                width: 0.02,
              ),
              smallText(title: 'Your current location')

            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.09),
            child: Expanded(
              flex: 1,
              child: Text(
                'Main Grand Trunk Rd, Defense Housing Authority Sector F DHA Phase II, Islamabad, Islamabad Capital Territory 44000, Pakistan',
                style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 0.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: theme.primaryColor,
                  fontFamily: 'Nunito Sans',
                ),
              ),
            ),
          ),
          CustomSized(height: 0.04,),
          SecondaryAccessButton(
            iconData: Icons.share_outlined,
              borderRadius: 30,
              width: 1,
              titleColor: theme.primaryColor,
              color: theme.colorScheme.surfaceContainerHighest,
              title: 'Share my trip', onTap: (){

          }),
          CustomSized(height: 0.02,),
          SecondaryAccessButton(
              iconData: Icons.wifi_calling_3_outlined,
              borderRadius: 30,
              width: 1,
              titleColor: theme.colorScheme.inversePrimary,
              color: theme.colorScheme.secondaryFixed,
              title: 'Call 911', onTap: (){

          }),
        ],
      ),
    );
  }
}

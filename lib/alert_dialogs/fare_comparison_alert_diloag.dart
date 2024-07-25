import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';

import '../consts/colors.dart';
import '../resubale_widgets/CustomButton.dart';
import '../resubale_widgets/Custom_Sized.dart';
import '../resubale_widgets/text_widgets.dart';


class FareComparisonAlertDialog extends StatelessWidget {
  const FareComparisonAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSized(height: 0.02),
          largeText(
            title: 'Fare comparison with',
            textSize: 18.0,
          ),
          CustomSized(height: 0.002),
          largeText(
            title: 'competitors',
            textSize: 18.0,
          ),
          CustomSized(height: 0.02),
          smallText(title: 'Check how discounted fares we provide to',color: primaryTextColor),
          CustomSized(height: 0.004),
          smallText(title: 'our users in comparison to other apps in',color: primaryTextColor),
          CustomSized(height: 0.004),
          smallText(title: 'the market for same distance and vehicles',color: primaryTextColor),
          CustomSized(height: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(compatetorsIcons.length, (index){
              return  Column(
                children: [
                  SvgPicture.asset(compatetorsIcons[index]),
                  CustomSized(height: 0.005),
                  largeText(title:'\$100',textSize: 17.0,color:  index ==1 ? primaryTextColor : secondaryTextColor),
                ],
              );
            }),
          ),
          CustomSized(height: 0.02),
          const Row(
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
                   'This comparison is based on market survey and collected and calculated by our AI systems.',
                   style: TextStyle(
                     fontSize: 10.0,
                     fontWeight: FontWeight.w400,
                     color: secondaryTextColor,
                     fontFamily: 'Nunito Sans',
                   ),
                 ),
               ),
             ],
           ),
          CustomSized(height: 0.02),
          CustomButton(
            onBoard: false,
            width: 1,
            title: 'Close',
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: 30,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';


class AirPortPickUpBottomSheet extends StatelessWidget {
  const AirPortPickUpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height * 0.38,
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(height: 0.02,),
                largeText(title: 'Additional charges'),
                CustomSized(height: 0.01,),
                largeText(title: 'Are you ready to pay extra \$10?',textSize: 17.0 ),
                CustomSized(height: 0.01,),
                smallText(title: 'Picking up from the airport will cost you extra'),
                CustomSized(height: 0.005,),
                Row(
                  children: [
                    smallText(title: 'charges of '),
                    smallText(title: '\$10 ',color: primaryTextColor,weight:FontWeight.w700),
                    smallText(title: 'like driver entry and exit fees'),
                  ],
                ),
                CustomSized(height: 0.005,),
                smallText(title: 'within airport taxi stand. If you select no, driver'),
                CustomSized(height: 0.005,),
                smallText(title: 'won’t be able to pick you within airport'),
                CustomSized(height: 0.005,),
                smallText(title: 'boundaries.'),
                CustomSized(height: 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(title: 'No, I can\'t', onTap: (){
                      Navigator.pop(context);
                    },borderRadius: 30,onBoard: false,width:0.4,color: secondaryWhiteColor,titleColor: primaryTextColor,),
                    CustomButton(title: 'Yes, I\'ll pay', onTap: (){
                      Navigator.pop(context);
                    },borderRadius: 30,onBoard: false,width:0.4,),
                  ],
                ),
                CustomSized(height: 0.02,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

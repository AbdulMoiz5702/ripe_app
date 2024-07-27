import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';


class AirPortPickUpBottomSheet extends StatelessWidget {
  const AirPortPickUpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Container(
      height: MediaQuery.sizeOf(context).height * 0.38,
      padding: EdgeInsets.all(10),
      decoration:  BoxDecoration(
        color: theme.scaffoldBackgroundColor,
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
          BottomSheetsLeadings(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(height: 0.02,),
                largeText(title: 'Additional charges',color: theme.primaryColor),
                CustomSized(height: 0.01,),
                largeText(title: 'Are you ready to pay extra \$10?',textSize: 17.0 ,color: theme.primaryColor),
                CustomSized(height: 0.01,),
                smallText(title: 'Picking up from the airport will cost you extra',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.005,),
                Row(
                  children: [
                    smallText(title: 'charges of ',color: theme.colorScheme.onSecondaryContainer),
                    smallText(title: '\$10 ',color: theme.primaryColor,weight:FontWeight.w700),
                    smallText(title: 'like driver entry and exit fees',color:theme.colorScheme.onSecondaryContainer ),
                  ],
                ),
                CustomSized(height: 0.005,),
                smallText(title: 'within airport taxi stand. If you select no, driver',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.005,),
                smallText(title: 'won’t be able to pick you within airport',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.005,),
                smallText(title: 'boundaries.',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SecondaryCustomButton(title: 'No, I can\'t', onTap: (){
                      Navigator.pop(context);
                    },borderRadius: 30,onBoard: false,width:0.4,color: theme.colorScheme.surfaceContainerHighest,titleColor: theme.colorScheme.primary,),
                    Consumer<ScheduleRideProvider>(builder: (context,provider,_){
                      return CustomButton(title: 'Yes, I\'ll pay', onTap: (){
                        provider.onChange(true);
                        Navigator.pop(context);
                      },borderRadius: 30,onBoard: false,width:0.4,);
                    }),
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

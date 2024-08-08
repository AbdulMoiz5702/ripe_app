import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../controllers/pessenger_ride_process_provider.dart';



class CancelRiderBottomSheet extends StatelessWidget {
  const CancelRiderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =  Provider.of<PessengerRideProcessProvider>(context,listen: false);
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      ),
      child:Column(
        children: [
          largeText(title: 'Cancel this order?',color: theme.primaryColor,textSize: 18.0),
          CustomSized(height: 0.02,),
          CustomButton(title: 'Continue ride', onTap: (){
            Navigator.pop(context);
          },onBoard: false,width: 1,borderRadius: 30,),
          CustomSized(height: 0.02,),
          SecondaryCustomButton(
            titleColor: theme.primaryColor,
            color: theme.colorScheme.surfaceContainerHighest,
            title: 'Yes, cancel this ride', onTap: (){
              Navigator.pop(context);
              controller.openCancelReasonBottomSheet(context: context);
          },onBoard: false,width: 1,borderRadius: 30,)
        ],
      ),
    );
  }
}

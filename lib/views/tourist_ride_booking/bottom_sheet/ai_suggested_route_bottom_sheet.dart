import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';

import '../../../resubale_widgets/text_widgets.dart';



class AiSuggestedRouteBottomSheet extends StatelessWidget {
  const AiSuggestedRouteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSized(height: 0.02),
          largeText(title: 'AI route change confirmation', textSize: 18.0,color: theme.primaryColor),
          CustomSized(height: 0.02),
          smallText(title: 'We’ve changed route for you with the help of AI.',color: theme.primaryColor),
          CustomSized(height: 0.004),
          smallText(title: 'Do you want to go with that route in order to save',color: theme.primaryColor),
          CustomSized(height: 0.004),
          smallText(title: 'fare?',color: theme.primaryColor),
          CustomSized(height: 0.02),
          Consumer<ScheduleRideProvider>(builder: (context,provider,_){
            return Column(
              children: [
                CustomButton(title: 'Continue with AI Route', onTap: (){
                  Navigator.pop(context);
                  provider.onAiRouteSelected(newPath: aiBot);
                  provider.changeTitle(value: ' AI suggested route');
                },onBoard: false,borderRadius: 30,width: 1,),
                CustomSized(height: 0.02),
                SecondaryCustomButton(title: 'Use original route', onTap: (){
                  provider.onAiRouteSelected(newPath: normalRoute);
                  provider.changeTitle(value: ' Use original route');
                  Navigator.pop(context);
                },onBoard: false,borderRadius: 30,width: 1,color: theme.colorScheme.surfaceContainerHighest,titleColor: theme.primaryColor,),
              ],
            );
          })

        ],
      ),
    );
  }
}

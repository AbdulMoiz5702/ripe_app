import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/text_widgets.dart';


class AddRiderToAvoriteBottomSheet extends StatelessWidget {
  const AddRiderToAvoriteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.32,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color:  theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          largeText(title: 'Add rider as favourite',color: theme.primaryColor,textSize: 18.0),
          CustomSized(height: 0.01,),
          largeText(textSize:14.0,title: 'Do you want to add this rider to your favourite',color: theme.colorScheme.onSecondaryContainer ),
          CustomSized(height: 0.002,),
          largeText(textSize:14.0,title: 'riders?',color: theme.colorScheme.onSecondaryContainer ),
          CustomSized(height: 0.022,),
          LocationAccessButton(
            title: 'Add rider to favourite', onTap: (){},width: 1,borderRadius: 30,),
          CustomSized(height: 0.02,),
          SecondaryCustomButton(
            titleColor: theme.primaryColor,
            color: theme.colorScheme.surfaceContainerHighest,
            title: 'No, I\'m fine', onTap: (){},width: 1,borderRadius: 30,onBoard: false,),
        ],
      ),
    );
  }
}

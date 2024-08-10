import 'package:flutter/material.dart';

import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';


class CardRemoveBottomSheets extends StatelessWidget {
  const CardRemoveBottomSheets({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSized(width: 0.2,height: 0,),
              largeText(title: 'Are you sure?', textSize: 18.0,color: theme.primaryColor),
              CustomSized(width: 0.15,height: 0,),
              CustomLeadingSecond(
                iconData: Icons.close,
                isSecondary: true,
                padding:  12,
              ),
            ],
          ),
          CustomSized(height: 0.02),
          SecondaryCustomButton(title: 'Yes, remove card', onTap: (){
            Navigator.pop(context);
          },onBoard: false,borderRadius: 30,width: 1,color: theme.colorScheme.surfaceContainerHighest,titleColor: theme.primaryColor,),
          CustomSized(height: 0.02),
          CustomButton(title: 'No, go back', onTap: (){
            Navigator.pop(context);
          },onBoard: false,borderRadius: 30,width: 1,),
        ],
      ),
    );
  }
}

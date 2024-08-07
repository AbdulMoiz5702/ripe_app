import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/cutom_leading text_feild.dart';
import '../../../resubale_widgets/text_widgets.dart';


class CustomTipBottomSheet extends StatelessWidget {
  const CustomTipBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:  theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSized(width: 0.15,height: 0,),
              largeText(
                  title: 'Add a custom tip',
                  textSize: 18.0,
                  color: theme.primaryColor),
              CustomSized(width: 0.055,height: 0,),
              CustomLeadingSecond(
                iconData: Icons.close,
                isSecondary: true,
                padding:  12,
              ),
            ],
          ),
          CustomSized(height: 0.02,),
          CustomLeadingTextField(
              isHintChange: true,
              leadingText: 'Amount',
              controller: textController,
              keyBoardType: TextInputType.text,
              obscureText:false ,
              hint: '\$',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {}),
          CustomSized(height: 0.02,),
          CustomButton(title: 'Done', onTap: (){},width: 1,borderRadius: 30,onBoard: false,),
        ],
      ),
    );
  }
}

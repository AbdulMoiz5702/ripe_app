import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/notification_list_tile.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../../consts/colors.dart';
import '../../../../resubale_widgets/cutom_leading text_feild.dart';

class AddCreditCardScreen extends StatelessWidget {
  const AddCreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(textSize:20.0,title: 'Add card',color: theme.primaryColor ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomLeadingTextField(
              isHintChange: true,
              leadingText: 'Card number',
              controller: textController,
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
              hint: 'xxxx xxxx xxxx xxxx',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {},
            ),
            CustomSized(height: 0.03,),
            Row(
              children: [
                Expanded(child: CustomLeadingTextField(
                  isHintChange: true,
                  leadingText: 'Expiry date',
                  controller: textController,
                  keyBoardType: TextInputType.emailAddress,
                  obscureText: false,
                  hint: 'MM/YY',
                  onValidator: (value) {},
                  onFieldSubmittedValue: (value) {},
                ),),
                CustomSized(width: 0.03,),
                Expanded(child: CustomLeadingTextField(
                  isHintChange: true,
                  leadingText: 'CVV',
                  controller: textController,
                  keyBoardType: TextInputType.emailAddress,
                  obscureText: false,
                  hint: '•••',
                  onValidator: (value) {},
                  onFieldSubmittedValue: (value) {},
                ),),
              ],
            ),
            CustomSized(height: 0.03,),
            CustomLeadingTextField(
              isHintChange: true,
              leadingText: 'Nickname(optional)',
              controller: textController,
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
              hint: 'United Bank Ltd.',
              onValidator: (value) {},
              onFieldSubmittedValue: (value) {},
            ),
            CustomSized(height: 0.002,),
            Row(
              children: List.generate(paymentCards.length, (index){
                return Container(
                  margin: EdgeInsets.all(5),
                    child: SvgPicture.asset(paymentCards[index],));
              }),
            ),
            Spacer(),
            NotificationListTile(title: 'Set as default account', value: true, onChanged: (value){}),
            CustomSized(height: 0.002,),
            CustomButton(title: 'Add card', onTap: (){},width: 1,borderRadius: 30,),
          ],
        ),
      ),
    );
  }
}

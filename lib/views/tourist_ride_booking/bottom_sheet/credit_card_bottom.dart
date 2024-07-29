import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../user_profile/your_account/add_credit_card.dart';

class CreditCardBottomSheet extends StatelessWidget {
  const CreditCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
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
          largeText(title: 'Select a payment method', textSize: 18.0,color: theme.primaryColor),
          CustomSized(height: 0.02,),
          Consumer<ScheduleRideProvider>(builder: (context,provider,_){
            return Column(
              children: List.generate(creditCardSheetIcon.length, (index){
                return ListTile(
                  dense: true,
                  leading: SvgPicture.asset(creditCardSheetIcon[index],color: theme.colorScheme.secondary,),
                  title: smallText(title:creditCardSheetText[index],color: theme.colorScheme.onSecondaryContainer,),
                  trailing: Radio<int>(
                    activeColor: theme.colorScheme.secondary,
                    splashRadius: 30,
                    value:index,
                    groupValue: provider.selectedValue,
                    onChanged: (value){
                      provider.handleRadioValueChange(index);
                    },
                  ),
                );
              }),
            );
          }),
          CustomSized(height: 0.02,),
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 20,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              CustomSized(
                width: 0.02,
              ),
              Expanded(
                child: Text(
                  'Your saved credit card/paypal account will be used to deduct fair amount.',
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSecondaryContainer,
                    fontFamily: 'Nunito Sans',
                  ),
                ),
              ),
            ],
          ),
          CustomSized(height: 0.01,),
          Align(
            alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddCreditCardScreen()));
                },
                  child: largeText(title: 'Add new account  ',textSize: 14.0,color: theme.colorScheme.secondary))),
        ],
      ),
    );
  }
}

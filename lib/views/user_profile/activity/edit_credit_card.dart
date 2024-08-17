import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/notification_list_tile.dart';
import 'package:ride_app/views/user_profile/setting_screens/payements_and_cards/add_credit_card.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/payment_and_wallet_widget.dart';
import '../../../resubale_widgets/text_widgets.dart';
import 'Card_remove_bottom_sheets.dart';



class EditCreditCard extends StatelessWidget {
  final String cardImage ;
  const EditCreditCard({required this.cardImage});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: theme.appBarTheme
        leading: CustomLeading(
          isHome: true,
        ),
        title: largeText(
            title: 'Payment & wallet',
            textSize: 20.0,
            color: theme.primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  checkBoxColor.withOpacity(0.9),
                  checkBoxColor.withOpacity(0.9),
                  checkBoxColor,
                  checkBoxColor,
                  checkBoxColor,

                ]),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      largeText(textSize: 12.0,title: 'DEBIT',color: whiteColor.withOpacity(0.6)),
                      SvgPicture.asset(cardImage,height: 25,width: 25,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(sim,height: 70,width: 70,),
                      largeText(textSize: 14.0,title: 'John Carter',color:whiteColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      largeText(textSize: 14.0,title: '•••• •••• •••• 1234',color: whiteColor),
                      largeText(title: 'Exp 11/26',textSize: 14.0,color: whiteColor.withOpacity(0.6)),
                    ],
                  )
                ],
              ),
            ),
            CustomSized(height: 0.02,),
            PaymentDoneAndWalletWidget(title: 'Peter', svgs: visaCardSVG, cardTitle: 'Habib Bank Ltd.', cardDetails: '•••• •••• •••• 1233',isEditCardScreen: true,onEditCardScreen: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddCreditCardScreen()));
            },isEditButton: true,onEdit: (){

            },),
            CustomSized(height: 0.02,),
            NotificationListTile(title: 'Set as default account', value: true, onChanged: (value){}),
            CustomSized(height: 0.35,),
            SecondaryCustomButton(
              title: 'Remove this card from wallet',
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor:theme.scaffoldBackgroundColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context, builder: (context){
                  return CardRemoveBottomSheets();
                });
              },
              width: 1,
              color:theme.colorScheme.secondaryFixedDim,
              titleColor: theme.colorScheme.secondaryFixed,
              borderRadius: 30.0,
              onBoard: false,
              widthbetweentextandicon: 0.0,
            )
          ],
        ),
      ),
    );
  }
}

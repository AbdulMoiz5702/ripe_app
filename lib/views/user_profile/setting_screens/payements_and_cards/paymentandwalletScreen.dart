import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/payment_and_wallet_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/user_profile/setting_screens/payements_and_cards/add_credit_card.dart';

import '../../../../resubale_widgets/Custom_Sized.dart';
import '../../activity/edit_credit_card.dart';

class Paymentandwalletscreen extends StatefulWidget {
  const Paymentandwalletscreen({super.key});

  @override
  State<Paymentandwalletscreen> createState() => _PaymentandwalletscreenState();
}

class _PaymentandwalletscreenState extends State<Paymentandwalletscreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
      body:

      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomSized(height: 0.02,),
              PaymentAndWalletWidget(
                  ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddCreditCardScreen()));
                  },
                  title: 'PAYPAL',
                  svgs: paypalSVG,
                  cardTitle: 'No account is connected',
                  buttontitle: 'Connect paypal account',
                  cardDetails:
                  'Add your Paypal account to enjoy a seamless payment experience.'),
              CustomSized(height: 0.02,),
              PaymentAndWalletWidget(
                  ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddCreditCardScreen()));
                  },
                  iscolorofSVG: true,
                  colorofSVG: theme.colorScheme.secondary,
                  title: 'CARDS',
                  svgs: cardSVG,
                  cardTitle: 'No card is added',
                  buttontitle: 'Add a Card',
                  cardDetails:
                  'Add card to enjoy a seamless payment experience.'),
              CustomSized(height: 0.02,),
              PaymentAndWalletWidget(
                ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCreditCardScreen()));
                },
                title: 'Apple Pay',
                svgs: applepaySVG,
                cardTitle: 'No Account is connected',
                buttontitle: 'Connect Apple Pay account',
                cardDetails:
                'Add your applepay account to enjoy a seamless payment experience.',

                iscolorofSVG: true,
                colorofSVG: theme.primaryColor,
              ),
              CustomSized(height: 0.02,),
              PaymentAndWalletWidget(
                ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCreditCardScreen()));
                },
                  title: 'Google Pay',
                  svgs: googlePaySVG,
                  cardTitle: 'No Account is connected',
                  buttontitle: 'Connect Google Pay account',
                  cardDetails:
                  'Add your G-Pay account to enjoy a seamless payment experience.',
                iscolorofSVG: true,
                colorofSVG: theme.primaryColor,
              ),
              CustomSized(height: 0.02,),
              PaymentDoneAndWalletWidget(title: 'Peter', svgs: paypalSVG, cardTitle: 'Peter', cardDetails: 'peter12@gmail.com',isdivider: true,onEdit: (){},),
              CustomSized(height: 0.02,),
              PaymentDoneAndWalletWidget(title: 'Peter', svgs: masterCardSVG, cardTitle: 'United Bank Ltd.', cardDetails: '•••• •••• •••• 1233',isEditButton: true,onEdit: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCreditCard(cardImage:masterCardSVG ,)));
              },),
              CustomSized(height: 0.02,),
              PaymentDoneAndWalletWidget(title: 'Peter', svgs: visaCardSVG, cardTitle: 'Habib Bank Ltd.', cardDetails: '•••• •••• •••• 1233',isEditButton: true,onEdit: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCreditCard(cardImage: visaCardSVG,)));
              },),
              CustomSized(height: 0.02,),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: SvgPicture.asset(shieldCheck),
                    ),
                    smallText(title: 'Your Info is stored securely', color: theme.colorScheme.onSecondaryContainer,),
                  ],
                ),
              ),
            ],
          ),
        ),
      )

    );
  }
}

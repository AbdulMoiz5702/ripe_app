import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/payment_and_wallet_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/user_profile/your_account/add_credit_card.dart';

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
        child:    Column(
          children: [
            PaymentDoneAndWalletWidget(
                title: 'Google Pay',
                svgs: googlePaySVG,
                cardTitle: 'Ishaqfarid',
                // buttontitle: 'Connect PayPal account',
                cardDetails:
                'ishaqfarid280@gmail.com',
                isdivider: true,
              colorofSVG: whiteColor,
              istitle: true,


            ),
            PaymentDoneAndWalletWidget(
              istitle: true,
                title: 'Paypal',
                svgs: paypalSVG,
                cardTitle: 'Ishaqfarid',
                // buttontitle: 'Connect PayPal account',
                cardDetails:
                '**** **** **** 4321',

            ),
            PaymentDoneAndWalletWidget(
                title: 'Paypal',
                svgs: paypalSVG,
                cardTitle: 'Ishaqfarid',
                // buttontitle: 'Connect PayPal account',
                cardDetails:
                '**** **** **** 1234',
              isdivider: true,

            ),


            PaymentAndWalletWidget(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddCreditCardScreen()));
              },

                title: 'Card',
                svgs: cardSVG,
                cardTitle: 'No card is added',
                buttontitle: 'Add a Card',
                cardDetails:
                'Add card to enjoy a seamless payment experience.'),

            PaymentAndWalletWidget(
              ontap: (){},
                title: 'Apple Pay',
                svgs: applepaySVG,
                cardTitle: 'No Account is connected',
                buttontitle: 'Connect Apple Pay account',
                cardDetails:
                'Add your applepay account to enjoy a seamless payment experience.',

              iscolorofSVG: true,
              colorofSVG: theme.primaryColor,
            ),



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
      )

    );
  }
}

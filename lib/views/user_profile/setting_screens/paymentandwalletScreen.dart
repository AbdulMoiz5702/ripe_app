import 'package:flutter/material.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/payment_and_wallet_widget.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

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
      body: Column(
        children: [


          // List.generate(paymentoptionsImages.length, (index){
          //   return PaymentAndWalletWidget(
          //       title: paymentoptionsText[index],
          //       svgs: paymentoptionsImages[index],
          //       cardTitle: cardTitle,
          //       buttontitle: buttontitle,
          //       cardDetails: cardDetails)
          //
          // }),
           ],
      ),
    );
  }
}

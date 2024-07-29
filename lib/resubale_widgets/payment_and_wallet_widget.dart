import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class PaymentAndWalletWidget extends StatelessWidget {
  final String title;
  final String svgs;
  final String cardTitle;
  final String buttontitle;
  final String cardDetails;
  const PaymentAndWalletWidget(
      {super.key,
      required this.title,
      required this.svgs,
      required this.cardTitle,
        required this.buttontitle,
      required this.cardDetails});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: [
          normalText(
              title: title,
              textSize: 12.0,
              color: theme.colorScheme.secondaryContainer,
              weight: FontWeight.w400),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colorScheme.secondaryContainer,
                ),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: SvgPicture.asset(svgs)),
                    Column(
                      children: [
                        largeText(title: cardTitle, color: theme.primaryColor, textSize: 12.0),
                        smallText(
                          title: cardDetails,
                          textSize: 12.0
                        )
                      ],
                    )
                  ],
                ),
                SecondaryCustomButton(
                    onBoard: false,
                    // isImagePath: false,
                    widthbetweentextandicon: 0.0,

                    title: buttontitle,

                    onTap: () {},
                    color: theme.colorScheme.primaryFixedDim,
                    width: 0.9,
                    borderRadius: 24,
                    titleColor: theme.colorScheme.inversePrimary
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

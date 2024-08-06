import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../rate_pessenger/rate_pessenger_screen.dart';

class PaymentInvoiceScreen extends StatelessWidget {
  const PaymentInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Payment Invoice',color: theme.primaryColor,textSize: 20.0),
        actions: [
          CustomLeadingSecond(iconData: Icons.close,isHome: true,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSized(height: 0.13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(title: 'Invoice ID:',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(height: 0.02,),
                    smallText(title: '#426225',color: theme.primaryColor),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(title: 'Payment date:',color: theme.colorScheme.onSecondaryContainer),
                    CustomSized(height: 0.02,),
                    smallText(title: '25 Apr, 2024 at 6:23PM',color: theme.primaryColor),
                  ],
                ),
              ],
            ),
            CustomSized(height: 0.02,),
            smallText(title: 'Payment account:',color: theme.colorScheme.onSecondaryContainer),
            CustomSized(height: 0.01,),
            Row(
              children: [
                SvgPicture.asset(masterCardSVG),
                CustomSized(width: 0.02,height: 0,),
                smallText(title: '**** **** **** 2421',color: theme.primaryColor,weight:FontWeight.w700),

              ],
            ),
            CustomSized(height: 0.02,),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.sizeOf(context).height * 0.23,
              width:MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallText(title: 'Ride fare',color: theme.colorScheme.onSecondaryContainer),
                      smallText(title: '\$100',color: theme.primaryColor,weight:FontWeight.w700 ),
                    ],
                  ),
                  CustomSized(height: 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallText(title: 'Pickup from airport',color: theme.colorScheme.onSecondaryContainer),
                      smallText(title: '\$10',color: theme.primaryColor,weight:FontWeight.w700 ),
                    ],
                  ),
                  CustomSized(height: 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallText(title: 'App commission (%10)',color: theme.colorScheme.onSecondaryContainer),
                      smallText(title: '-\$5',color: theme.primaryColor,weight:FontWeight.w700 ),
                    ],
                  ),
                  CustomSized(height: 0.02,),
                  DottedDivider(),
                  CustomSized(height: 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallText(title: 'Total fare',color: theme.primaryColor,weight:FontWeight.w700 ),
                      smallText(title: '-\$105',color: theme.primaryColor,weight:FontWeight.w700 ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 20,
                  ),
                  CustomSized(
                    width: 0.02,
                  ),
                  Expanded(
                    child: Text(
                      'Ride fare has been added to your default payment account.',
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.onSecondaryContainer,
                        fontFamily: 'Nunito Sans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSized(height: 0.12,),
            SecondaryAccessButton(title: 'Report issue', onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RatePessengerScreen()));
            },borderRadius: 30,width: 1,),
          ],
        ),
      ),
    );
  }
}

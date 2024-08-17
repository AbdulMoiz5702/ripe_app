import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/chart.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../../../consts/strings.dart';



class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Wallet',textSize: 20.0,color: theme.primaryColor),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chart(),
              CustomSized(height: 0.02,),
              largeText(textSize: 12.0,color: theme.colorScheme.onSecondaryContainer,title: 'Monthly earnings'),
              Column(
                children: List.generate(monthlyEarning.length, (index){
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        largeText(title: monthlyEarning[index]['Month'],color:theme.colorScheme.onSecondaryContainer,textSize: 14.0 ),
                        largeText(title: '\$${monthlyEarning[index]['earning']}',color: theme.primaryColor,textSize: 18.0)
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

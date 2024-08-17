import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../consts/strings.dart';
import '../../../controllers/help_and_support_provider.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          leading: CustomLeading(
            isHome: true,
          ),
          title: largeText(
              title: 'Help', textSize: 20.0, color: theme.primaryColor),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.headset_mic_outlined,
                  color: theme.colorScheme.secondary,
                  size: 20,
                ),
                CustomSized(
                  width: 0.02,
                  height: 0,
                ),
                largeText(
                  textSize: 14.0,
                  title: 'Support',
                  color: theme.colorScheme.secondary,
                ),
                CustomSized(
                  width: 0.1,
                  height: 0,
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width * 1, 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(helpAndSupportList.length, (index) {
                  return Consumer<HelpAndSupportProvider>(
                      builder: (context, provider, _) {
                    return GestureDetector(
                      onTap: () {
                        provider.changeIndex(index);
                      },
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            smallText(
                              title: helpAndSupportList[index],
                              color: provider.index == index
                                  ? theme.primaryColor
                                  : theme.colorScheme.onSecondaryContainer,
                            ),
                            CustomSized(
                              height: 0.004,
                              width: 0,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: 2,
                              color: provider.index == index
                                  ? theme.colorScheme.tertiaryContainer
                                  : theme.scaffoldBackgroundColor,
                            )
                          ],
                        ),
                      ),
                    );
                  });
                }),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSized(height: 0.02,width: 0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(allQuestionsList.length, (index) {
                  return ExpansionTile(
                    dense: true,
                    title: largeText(
                        textSize: 14.0,
                        color: theme.primaryColor,
                        title: allQuestionsList[index]),
                    trailing: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                    children: [
                      ListTile(
                        title: Text('Most ride-hailing apps accept credit/debit cards, digital wallets, and cash. Check the app settings to add your preferred payment method.',softWrap: true,style: TextStyle(
                          color: theme.primaryColor,
                          height: 1.5,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Nunito Sans',
                        ),),
                      ),
                      CustomSized(height: 0.02,width: 0,),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/language_provider.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../consts/colors.dart';
import '../../../consts/strings.dart';


class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Language',textSize: 20.0,color: theme.primaryColor),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSized(height: 0.01,width: 0,),
          Align(
            alignment: Alignment.centerLeft,
              child: smallText(title: '      This language will be used in the whole app .',color: theme.colorScheme.onSecondaryContainer)),
          CustomSized(height: 0.01,width: 0,),
        Consumer<LanguageProvider>(builder: (context, provider, _) {
        return Column(
          children: List.generate(flagList.length, (index) {
            return GestureDetector(
              onTap: () {
                provider.changeIndex(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                alignment: Alignment.centerLeft,
                height: MediaQuery.sizeOf(context).height * 0.065,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: provider.indexx == index
                      ? theme.colorScheme.surfaceContainerHighest
                      : Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(flagList[index],height: 30,width: 30,),
                        CustomSized(width: 0.04,height: 0,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            smallText(
                                title: flagListTile[index],
                                color: theme.primaryColor),
                            CustomSized(height: 0.002,width: 0,),
                            smallText(
                                title: flagListSubTile[index],
                                color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                          ],
                        ),
                      ],
                    ),
                    provider.indexx == index
                        ? Icon(Icons.check,color: alertDialogIconColor,)
                        : Container(
                      height: 0,
                      width: 0,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      }),
          CustomSized(height: 0.02,width: 0,),
          CustomButton(title: 'Confirm language', onTap: (){
          },onBoard: false,width: 0.9,borderRadius: 30,),
        ],
      ),
    );
  }
}



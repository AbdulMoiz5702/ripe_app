import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/language_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../consts/colors.dart';
import '../../../consts/strings.dart';


class DefaultCityScreen extends StatelessWidget {
  const DefaultCityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Select city',textSize: 20.0,color: theme.primaryColor),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSized(height: 0.01,width: 0,),
          Align(
              alignment: Alignment.centerLeft,
              child: smallText(title: '      Choose a city you want to book rides in by default.',color: theme.colorScheme.onSecondaryContainer)),
          CustomSized(height: 0.02,width: 0,),
          Row(
            children: [
              CustomSized(width: 0.05,height: 0,),
              Icon(Icons.gps_fixed_outlined,color: theme.colorScheme.secondary,),
              CustomSized(width: 0.04,height: 0,),
              smallText(title: 'Use my current location',color:  theme.colorScheme.secondary)
            ],
          ),
          CustomSized(height: 0.01,width: 0,),

          Consumer<LanguageProvider>(builder: (context, provider, _) {
            return Column(
              children: List.generate(defaultCityList.length, (index) {
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
                        smallText(
                            title: defaultCityList[index],
                            color: theme.primaryColor),
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
        ],
      ),
    );
  }
}



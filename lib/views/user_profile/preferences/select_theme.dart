import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/theme_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../consts/strings.dart';


class ThemeChangeScreen extends StatelessWidget {
  const ThemeChangeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(isHome: true,),
        title: largeText(title: 'Theme',textSize: 20.0,color: theme.primaryColor),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               smallText(title: 'Yorem ipsum dolor sit amet, consectetur adipiscing',color: theme.colorScheme.onSecondaryContainer),
               CustomSized(height: 0.01),
               smallText(title: 'elit. Nunc vulputate libero et velit interdum, ac ',color: theme.colorScheme.onSecondaryContainer),
               CustomSized(height: 0.01),
               smallText(title: 'aliquet odio mattis.',color: theme.colorScheme.onSecondaryContainer),
             ],
           ),
         ),
          Consumer<ThemeProvider>(builder: (context,provider,_){
            return Column(
              children: List.generate(selectTheme.length, (index){
                return RadioListTile(
                     activeColor: theme.colorScheme.secondary,
                     title: smallText(title: selectTheme[index]),
                      value: provider.value, groupValue: index, onChanged: (value){
                      switch(index){
                        case 0:
                          provider.themeMode  = ThemeMode.system;
                          provider.toggleTheme(0);
                          break;
                        case 1:
                          provider.themeMode  = ThemeMode.light;
                          provider.toggleTheme(1);
                        case 2:
                          provider.themeMode  = ThemeMode.dark;
                          provider.toggleTheme(2);

                      }
                });
              }),
            );
          }),
        ],
      ),
    );
  }
}

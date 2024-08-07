import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/bottom_sheets_leading.dart';
import 'package:ride_app/resubale_widgets/customTextFeild.dart';

import '../../../consts/colors.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/cutom_leading text_feild.dart';
import '../../../resubale_widgets/home_screen_Text_Feild.dart';
import '../../../resubale_widgets/text_widgets.dart';

class MakeAddressFavorite extends StatelessWidget {
  final String address;
  final String subAddress;
  const MakeAddressFavorite({required this.address,required this.subAddress});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration:  BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetsLeadings(),
          CustomSized(height: 0.02,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(height: 0.02,),
                largeText(title: 'Saved addresses',color: theme.primaryColor),
                CustomSized(height: 0.01,),
                smallText(title: 'This address will be displayed in search list when ',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.01,),
                smallText(title: 'you’ll search with saved name.',color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.03,),
                HomeScreenTextField(
                  textColor: theme.primaryColor,
                  removeLeadingIcon: true,
                  controller: textController,
                  hint: 'Saved address name',
                  onValidator: (value) {},
                  onFieldSubmittedValue: (newValue) {},
                  iconPath: searchBlack,
                  color: theme.colorScheme.surfaceContainerHighest,
                  hintColor: theme.primaryColor,
                ),
                CustomSized(height: 0.02,),
                ListTile(
                  dense: true,
                  leading: SvgPicture.asset(currentLocationSVG,color: theme.colorScheme.secondary,),
                  title:smallText(title:address,color: theme.primaryColor) ,
                  subtitle: smallText(title:subAddress,textSize: 11.0),
                  trailing: Icon(Icons.favorite,color: theme.colorScheme.secondary,),
                ),
                CustomSized(height: 0.02,),
                LocationAccessButton(width:1,title: 'Save address',iconData: Icons.favorite_border,color: theme.colorScheme.inversePrimary,titleColor:theme.primaryColor,onTap: (){
                  Navigator.pop(context);
                },borderRadius: 30,),
                CustomSized(height: 0.02,),
                SecondaryCustomButton(width:1,title: 'Don\'t save', onTap: (){
                  Navigator.pop(context);
                },borderRadius: 30,color: theme.colorScheme.inversePrimary,titleColor: theme.primaryColor,onBoard: false,isBorder: true,borderColor:theme.colorScheme.onSecondaryContainer,),
                CustomSized(height: 0.002,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

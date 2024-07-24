import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/user_profile_button.dart';
import '../../resubale_widgets/text_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Account and activity',textSize: 20.0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSized(height: 0.002,),
            UserProfileButton(
                title: 'Abdul Moiz',
                avatarImagePath: avatar,
                email: 'abdulmoizkhan5702@gamil.com',
                tileOnTap: (){},
                buttonOnTap: (){}),
            const Divider(color: dividerColor,),
            const CustomSized(height: 0.002,),
            largeText(title: 'YOUR ACCOUNT',textSize: 12.0,color: secondaryTextColor),
            Column(
              children: List.generate(yourAccount.length, (index){
                return UserProfileSettingTile(iconData: yourAccount[index], onTap: (){}, title: yourAccountText[index]);
              }),
            ),
            const Divider(color: dividerColor,),
            const CustomSized(height: 0.002,),
            largeText(title: 'ACTIVITY',textSize: 12.0,color: secondaryTextColor),
            Column(
              children: List.generate(yourActivity.length, (index){
                return UserProfileSettingTile(iconData: yourActivity[index], onTap:(){}, title: yourActivityText[index]);
              }),
            ),
            const Divider(color: dividerColor,),
            const CustomSized(height: 0.002,),
            largeText(title: 'SUPPORT',textSize: 12.0,color: secondaryTextColor),
            Column(
              children: List.generate(yourSupport.length, (index){
                return UserProfileSettingTile(iconData: yourSupport[index], onTap: (){}, title: yourSupportText[index]);
              }),
            ),
            const Divider(color: dividerColor,),
            const CustomSized(height: 0.002,),
            largeText(title: 'PREFERENCES',textSize: 12.0,color: secondaryTextColor),
            Column(
              children: List.generate(yourPreference.length, (index){
                return UserProfileSettingTile(iconData: yourPreference[index], onTap: (){}, title: yourPreferenceText[index]);
              }),
            ),
            const Divider(color: dividerColor,),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/user_profile_button.dart';
import 'package:ride_app/views/user_profile/preferences/select_theme.dart';
import 'package:ride_app/views/user_profile/setting_screens/paymentandwalletScreen.dart';
import 'package:ride_app/views/user_profile/setting_screens/profile_Screen.dart';
import 'package:ride_app/views/user_profile/your_account/change_password.dart';
import '../../resubale_widgets/text_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(
            title: 'Account and activity',
            textSize: 20.0,
            color: theme.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSized(
              height: 0.002,
            ),
            UserProfileButton(
                title: 'Abdul Moiz',
                avatarImagePath: avatar,
                email: 'abdulmoizkhan5702@gamil.com',
                tileOnTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                },
                buttonOnTap: () {}),
            const CustomSized(
              height: 0.002,
            ),
            Divider(
              color: theme.dividerColor,
            ),
            const CustomSized(
              height: 0.002,
            ),
            largeText(
                title: 'YOUR ACCOUNT',
                textSize: 12.0,
                color: theme.colorScheme.onSecondaryContainer),
            Column(
              children: List.generate(yourAccount.length, (index) {
                return UserProfileSettingTileSVg(
                    imagePath: yourAccount[index],
                    onTap: () {
                      switch(index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => Paymentandwalletscreen()));
                          break;
                        case 1:
                          break;
                        case 2:
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => ChangePassword()));
                          break;
                      }

                    },
                    title: yourAccountText[index]);
              }),
            ),
            Divider(
              color: theme.dividerColor,
            ),
            const CustomSized(
              height: 0.002,
            ),
            largeText(
                title: 'ACTIVITY',
                textSize: 12.0,
                color: theme.colorScheme.onSecondaryContainer),
            Column(
              children: List.generate(yourActivity.length, (index) {
                return UserProfileSettingTileSVg(
                    imagePath: yourActivity[index],
                    onTap: () {},
                    title: yourActivityText[index]);
              }),
            ),
            Divider(
              color: theme.dividerColor,
            ),
            const CustomSized(
              height: 0.002,
            ),
            largeText(
                title: 'SUPPORT',
                textSize: 12.0,
                color: theme.colorScheme.onSecondaryContainer),
            Column(
              children: List.generate(yourSupport.length, (index) {
                return UserProfileSettingTileSVg(
                    imagePath: yourSupport[index],
                    onTap: () {},
                    title: yourSupportText[index]);
              }),
            ),
            Divider(
              color: theme.dividerColor,
            ),
            const CustomSized(
              height: 0.002,
            ),
            largeText(
                title: 'PREFERENCES',
                textSize: 12.0,
                color: theme.colorScheme.onSecondaryContainer),
            Column(
              children: List.generate(yourPreference.length, (index) {
                return UserProfileSettingTileSVg(
                    imagePath: yourPreference[index],
                    onTap: () {
                      switch (index) {
                        case 0:
                          break;
                        case 1:
                          break;
                        case 2:
                          break;
                        case 3:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThemeChangeScreen()));
                      }
                    },
                    title: yourPreferenceText[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/user_profile_button.dart';
import 'package:ride_app/views/user_profile/preferences/bio_metric_screen.dart';
import 'package:ride_app/views/user_profile/preferences/select_theme.dart';
import 'package:ride_app/views/user_profile/setting_screens/payements_and_cards/paymentandwalletScreen.dart';
import 'package:ride_app/views/user_profile/setting_screens/profile_Screen.dart';
import 'package:ride_app/views/user_profile/your_account/change_password.dart';
import '../../resubale_widgets/text_widgets.dart';
import '../RIDER_SIDES_SCREENS/rider_bottom_navigation/Rider_bottom_screen.dart';
import '../bottom_screen/Main_bottom_Screen.dart';
import 'activity/favorite_driver_screen.dart';
import 'activity/rider_history.dart';
import 'preferences/Defeault_city.dart';
import 'preferences/languages_screen.dart';
import 'setting_screens/saved_address/saved_address_screen.dart';
import 'support/help_and_support_screen.dart';

class UserProfileScreen extends StatelessWidget {
  final bool isUserScreen;
  const UserProfileScreen({this.isUserScreen = false});

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
                isUserScreen: isUserScreen,
                title: 'Abdul Moiz',
                avatarImagePath: avatar,
                email: 'abdulmoizkhan5702@gamil.com',
                tileOnTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                },
                buttonOnTap: () {
                  if(isUserScreen == true){
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (ctx) => MainBottomScreen()));
                  }else{
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (ctx) => RiderBottomScreen()));
                  }


                }),
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
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => SavedAddressScreen()));
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
            isUserScreen == true ? Column(
              children: List.generate(1, (index) {
                return UserProfileSettingTileSVg(
                    imagePath: yourActivity[index],
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => UserRiderHistoryScreen()));
                    },
                    title: yourActivityText[index]);
              }),
            ): Column(
              children: List.generate(yourActivity.length, (index) {
                return UserProfileSettingTileSVg(
                    imagePath: yourActivity[index],
                    onTap: () {
                      switch(index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => UserRiderHistoryScreen()));
                          break;
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => FavoriteDriverScreen()));
                          break;
                      }
                    },
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
                    onTap: () {
                      switch(index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => HelpAndSupportScreen()));
                          break;
                        case 1:
                          break;
                      }
                    },
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BioMetricScreen()));
                          break;
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LanguagesScreen()));
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DefaultCityScreen()));
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

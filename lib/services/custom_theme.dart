import 'package:flutter/material.dart';
import '../consts/colors.dart';


ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: false,
    // main color
    primaryColor: primaryTextColor,

    colorScheme: const ColorScheme.light(
      // Logoipsum Color// prmimary color
      primary: primaryTextColor,
      // tourist and find driver button color // seconday color
      primaryContainer: checkBoxColor,
      // primary inverse
      inversePrimary: whiteColor ,
      // secodary color
      secondary: checkBoxColor,
        // ind driver local guide caontainer color
        onSecondary:  containerBorderColor,
      //  buttonText
      secondaryContainer: whiteColor,
       // secodary text colors,
      onSecondaryContainer: secondaryTextColor,
      // auth screens divider colors
      surface: authDarkDividerColor,
      // custom text filed border
      onSurface: textfieldColorBorderColor,
      // custom text filed hint color,
      surfaceBright: textFieldHintColor,
      // home_screen_text_field fill color,
      surfaceContainer: textfieldColor,
      // become a driver_Container_border_color
      surfaceDim:containerBorderColor,
      // become a driver_button_border_color
      surfaceContainerHigh:textfieldColor,
      //become a driver_button_text_color
      surfaceTint: checkBoxColor,
      //  invite_friend_button_border_color
      surfaceContainerLowest: otpColor,
      // upload documnets container color ,
      surfaceContainerHighest: secondaryWhiteColor,
      // vechile details check color
      surfaceContainerLow: checkColor,
      //  bottom_screen select where to / like attraction air port buttons etc
      tertiaryContainer:primaryTextColor,
        // cancel red button  color
      secondaryFixedDim: lightRedButtonColor,
      // cancel red button text color
      secondaryFixed: lightRedCancelButtonTextColor,
        // shedule screen in progress container color
      shadow: lightProgressRideColor,
      // shedule screen in progress  button color
      outline: lightDarkGreenColor,
       // shedule screen in progress  button Text color


      outlineVariant: lightGreenColor,

      //profile Screen image background Color. main image in profile screen
      onPrimaryFixed:  profileScreenopacityColor,

      //outline color in text of profile screen
      primaryFixed: iconColor,

      //outline color in textformfield of profile screen
      onSurfaceVariant: greyColor,

      //button color in profile screen
      primaryFixedDim: buttonColor,






    ),
    // divider color
    dividerColor: lightDividerColor,
    // BackGround_color
    scaffoldBackgroundColor: secondaryBackGround,
    // picture guide icon color // car pictures screen
    canvasColor: darkBlueColor,
    // picture guide card color // car pictures screen
     cardColor: secondayBlueColor,
    //  App bar
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: darkBackGroundColor, // Set the color you want for the leading icon
      ),
      color: whiteColor,
    ),


  );
}



ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: false,
    // main color
    primaryColor: whiteColor,
    colorScheme:const  ColorScheme.dark(
      // Logoipsum Color / prmimary color
      primary: whiteColor,
      // tourist and find driver button color // seconday color
      primaryContainer: secondaryBackGround,
      // primary inverse
      inversePrimary: primaryTextColor,
      // secondary color
      secondary: darkThemeBrandNameColor,
        // ind driver local guide caontainer color
        onSecondary:  darkLocalGuideConatinerColor,
      // buttonText
      secondaryContainer: primaryTextColor,
      // secodary text colors,
      onSecondaryContainer: darkSecondaryTextColors,
      // auth screens divider colors
      surface: authDarkDividerColor,
      // custom text filed border
      onSurface: darkTextFieldBorderColor,
      // custom text filed hint color,
      surfaceBright: darkTextFieldHintColor,
      // home_screen_text_field fill color,
      surfaceContainer: darkTextFieldColor,
      // become a driver_Container_border_color
      surfaceDim:primaryTextColor,
      // become a driver_button_border_color
      surfaceContainerHigh:whiteColor,
      //become a driver_button_text_color
      surfaceTint: primaryTextColor,
      //  invite_friend_button_border_color
      surfaceContainerLowest: primaryTextColor,
      // upload documnets container color ,
      surfaceContainerHighest: darkUploadDocumentsContainerColor,
      // vechile details check color
      surfaceContainerLow: darkCheckContainerColor,
      //  bottom_screen select where to / like attraction air port buttons etc
      tertiaryContainer:darkThemeBrandNameColor,
        // cancel red button  color
        secondaryFixedDim: darkRedCancelButtonColor,
        // cancel red button text color
        secondaryFixed: darkRedCancelButtonTextColor,
      // shedule screen in progress container color
      shadow: darkProgressRideColor,
      // shedule screen in progress container card color
      outline: darkDarkGreenColor,
        // shedule screen in progress  button Text color
        outlineVariant: darkLightGreenColor,

      //profile Screen image background Color. main image in profile screen
      onPrimaryFixed:  primaryTextColor,

      //outline color in profile screen
      primaryFixed: iconColor,


      //button color in profile screen
      primaryFixedDim: buttonColor,


    ),
    // divider color
    dividerColor: darkDividerColor,
    // picture guide icon color // car pictures screen
      cardColor: darkPictureGuideIconColor,
    // picture guide card color // car pictures screen
      canvasColor: darkPictureGuideContainerColor,
    // BackGround_color
    scaffoldBackgroundColor: darkBackGroundColor,
     // App Bar
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(
          color: whiteColor, // Set the color you want for the leading icon
        ),
        color: darkBackGroundColor,
      )
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class UserProfileButton extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String email;
  final VoidCallback tileOnTap;
  final VoidCallback buttonOnTap;
  final bool isUserScreen;
  const UserProfileButton(
      {super.key,
      required this.title,
      required this.avatarImagePath,
      required this.email,
      required this.tileOnTap,
      required this.buttonOnTap,
      this.isUserScreen = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatarImagePath),
            ),
            title: largeText(
                textSize: 18.0, title: title, color: theme.primaryColor),
            subtitle: smallText(
                title: email, color: theme.colorScheme.onSecondaryContainer),
            trailing: Icon(Icons.arrow_forward_ios,
                color: theme.colorScheme.onSecondaryContainer),
            onTap: tileOnTap,
          ),
          CustomSized(
            height: 0.005,
          ),
          SecondaryAccessButton(
            title: isUserScreen == true ? 'Passenger mode' : 'Driver mode',
            onTap: buttonOnTap,
            iconData: Icons.next_plan_outlined,
            width: 1,
            borderRadius: 30,
            isImagePath: true,
            imagePath: isUserScreen == true ? localSvg : steeringWheelsSVG,
            color: theme.primaryColor,
            titleColor: theme.colorScheme.inversePrimary,
            widthbetweentextandicon: isUserScreen == true ? 0.01: 0.03,
          )
        ],
      ),
    );
  }
}

class UserProfileSettingTileSVg extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String imagePath;
  const UserProfileSettingTileSVg(
      {super.key,
      required this.imagePath,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        imagePath,
        color: theme.primaryColor,
      ),
      title: smallText(title: title, color: theme.primaryColor),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: theme.colorScheme.onSecondaryContainer,
      ),
      onTap: onTap,
    );
  }
}

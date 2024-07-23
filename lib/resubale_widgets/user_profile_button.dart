import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';


class UserProfileButton extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String email;
  final VoidCallback tileOnTap;
  final VoidCallback buttonOnTap;
  const UserProfileButton({required this.title,required this.avatarImagePath,required this.email,required this.tileOnTap,required this.buttonOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatarImagePath),
            ),
            title: largeText(textSize: 18.0,title:title),
            subtitle: smallText(title: email),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap:tileOnTap,
          ),
          LocationAccessButton(title: 'Driver mode', onTap:buttonOnTap,iconData: Icons.next_plan_outlined,width: 0.8,borderRadius: 30,)
        ],
      ),
    );
  }
}

class UserProfileSettingTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData iconData;
  const UserProfileSettingTile({required this.iconData,required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData,color: primaryTextColor,),
      title: smallText(title: title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap:onTap,
    );
  }
}




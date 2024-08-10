import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class NormalNotificationListTile extends StatelessWidget {
  final  String title ;
  final  String description ;
  final  String date ;
  const NormalNotificationListTile({required this.title,required this.description,required this.date});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      tileColor: theme.colorScheme.surfaceContainerHighest,
      leading: Container(
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greyColor.withOpacity(0.12)),
        child: SvgPicture.asset(bellSimpleSvg,color: theme.colorScheme.secondary,),
      ),
      title: largeText(textSize: 14.0,title: title,color: theme.primaryColor),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSized(height: 0.01,width: 0,),
          Text(description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Nunito Sans',
            color: theme.colorScheme.onSecondaryContainer,
            height: 1.5,
          ),),
          CustomSized(height: 0.006,width: 0,),
          smallText(textSize: 11.0,color: theme.dividerColor,title: date)
        ],
      ),
    );
  }
}


class ScheduleNotificationListTile extends StatelessWidget {
  final  String title ;
  final  String day ;
  final  String description ;
  final  String date ;
  const ScheduleNotificationListTile({required this.title,required this.description,required this.date,required this.day});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      tileColor: theme.scaffoldBackgroundColor,
      leading: Container(
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greyColor.withOpacity(0.12)),
        child: SvgPicture.asset(calenderSvg,color: theme.colorScheme.secondary,),
      ),
      title:largeText(textSize: 14.0,title: title,color: theme.primaryColor),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSized(height: 0.01,width: 0,),
          Row(
            children: [
              smallText(textSize: 14.0,title: 'Your ride is scheduled for ',color: theme.primaryColor),
              largeText(textSize: 14.0,title: day,color: theme.primaryColor),
              smallText(textSize: 14.0,title: ' at',color: theme.primaryColor),
            ],
          ),
          CustomSized(height: 0.005,width: 0,),
          Row(
            children: [
              largeText(textSize: 14.0,title: description,color: theme.primaryColor),
              smallText(textSize: 14.0,title: '. Be ready!',color: theme.primaryColor),
            ],
          ),
          CustomSized(height: 0.006,width: 0,),
          smallText(textSize: 11.0,color: theme.dividerColor,title: date)
        ],
      ),
    );
  }
}


class NewMessageNotificationListTile extends StatelessWidget {
  final  String title ;
  final  String name ;
  final  String date ;
  const NewMessageNotificationListTile({required this.title,required this.name,required this.date,});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      tileColor: theme.colorScheme.surfaceContainerHighest,
      leading: Container(
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greyColor.withOpacity(0.12)),
        child: SvgPicture.asset(messageSVG,color: theme.colorScheme.secondary,),
      ),
      title:largeText(textSize: 14.0,title: title,color: theme.primaryColor),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSized(height: 0.01,width: 0,),
          Row(
            children: [
              smallText(textSize: 14.0,title: 'You’ve received a new message from',color: theme.primaryColor),
            ],
          ),
          CustomSized(height: 0.005,width: 0,),
          Row(
            children: [
              smallText(textSize: 14.0,title:name,color: theme.primaryColor),
              smallText(textSize: 14.0,title: '. Check it out',color: theme.colorScheme.secondary),
            ],
          ),
          CustomSized(height: 0.006,width: 0,),
          smallText(textSize: 11.0,color: theme.dividerColor,title: date)
        ],
      ),
    );
  }
}


class UserRatingNotificationListTile extends StatelessWidget {
  final  String title ;
  final  String description ;
  final  String date ;
  const UserRatingNotificationListTile({required this.title,required this.description,required this.date});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      tileColor: theme.colorScheme.surfaceContainerHighest,
      leading: Container(
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greyColor.withOpacity(0.12)),
        child: SvgPicture.asset(startSVG,color: theme.colorScheme.secondary,),
      ),
      title: largeText(textSize: 14.0,title: title,color: theme.primaryColor),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSized(height: 0.01,width: 0,),
          Text(description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Nunito Sans',
              color: theme.colorScheme.onSecondaryContainer,
              height: 1.5,
            ),),
          CustomSized(height: 0.006,width: 0,),
          smallText(textSize: 11.0,color: theme.dividerColor,title: date)
        ],
      ),
    );
  }
}



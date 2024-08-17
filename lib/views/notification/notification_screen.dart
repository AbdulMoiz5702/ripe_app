import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/views/notification/notification_settings_screen.dart';
import '../../resubale_widgets/normal_notiication_list_tile.dart';
import '../../resubale_widgets/text_widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey _toolTipKey = GlobalKey();

  bool notiy = false ;

  @override
  void initState() {
    super.initState();
    // Show the tooltip after a short delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        final dynamic tooltip = _toolTipKey.currentState;
        tooltip?.ensureTooltipVisible();
        notiy = true ;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(),
        title: largeText(
            title: 'Notifications', textSize: 20.0, color: theme.primaryColor),
        actions: [
          Tooltip(
            decoration: BoxDecoration(
                color: theme.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(8)),
            key: _toolTipKey,
            message: 'Customize your notifications',
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: theme.primaryColor,
              fontFamily: 'Nunito Sans',
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const NotificationSettingsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings, color: iconColor),
            ),
          ),
        ],
      ),
      body: notiy == true ? Column(
        children: [
          CustomSized(height: 0.02,width: 0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.done_all_outlined,color: theme.colorScheme.secondary,),
              CustomSized(width: 0.02,height: 0,),
              largeText(textSize: 15.0,title: 'Mark all as read',color: theme.colorScheme.secondary,),
              CustomSized(width: 0.1,height: 0,),
            ],
          ),
          CustomSized(height: 0.02,width: 0,),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  NormalNotificationListTile(title: 'Title', description: 'Dorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.', date: 'Today at 12:45PM'),
                  ScheduleNotificationListTile(title: 'Scheduled ride ', description: '9:00 AM', date: 'Today at 12:45PM', day: 'tomorrow'),
                  NewMessageNotificationListTile(title: 'New Message', name: 'Joshua', date: 'Today at 12:45PM',),
                  UserRatingNotificationListTile(title: 'User Rating', description: 'Rate your recent ride with Alex. Your feedback matters!', date: 'Today at 12:45PM'),
                  NormalNotificationListTile(title: 'Title', description: 'Dorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.', date: 'Today at 12:45PM'),
                  ScheduleNotificationListTile(title: 'Scheduled ride ', description: '9:00 AM', date: 'Today at 12:45PM', day: 'tomorrow'),
                  NewMessageNotificationListTile(title: 'New Message', name: 'Joshua', date: 'Today at 12:45PM',),
                  UserRatingNotificationListTile(title: 'User Rating', description: 'Rate your recent ride with Alex. Your feedback matters!', date: 'Today at 12:45PM'),
                ],
              ),
            ),
          ),
        ],
      )
          :Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              notificationBell,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
          ),
          largeText(
              title: 'No notifications yet',
              textSize: 17.0,
              color: theme.primaryColor),
          const CustomSized(height: 0.02),
          smallText(
              title: 'Qorem ipsum dolor sit amet, consectetur',
              color: theme.colorScheme.onSecondaryContainer),
          smallText(
              title: ' adipiscing elit. Nunc vulputate libero et velit',
              color: theme.colorScheme.onSecondaryContainer),
          smallText(
              title: ' interdum, ac aliquet odio mattis.',
              color: theme.colorScheme.onSecondaryContainer),
        ],
      ),
    );
  }
}

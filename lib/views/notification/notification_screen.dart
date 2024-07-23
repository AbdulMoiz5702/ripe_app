import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/views/notification/notification_settings_screen.dart';
import '../../resubale_widgets/text_widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey _toolTipKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Show the tooltip after a short delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        final dynamic tooltip = _toolTipKey.currentState;
        tooltip?.ensureTooltipVisible();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: largeText(title: 'Notifications', textSize: 20.0),
        actions: [
          Tooltip(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(8)
            ),
            key: _toolTipKey,
            message: 'Customize your notifications',
            textStyle:  const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: whiteColor,
              fontFamily:'Nunito Sans',
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
              icon: Icon(Icons.settings, color: iconColor),
            ),
          ),
        ],
      ),
      backgroundColor: secondaryBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              notificationBell,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
          ),
          largeText(title: 'No notifications yet', textSize: 17.0),
          CustomSized(height: 0.02),
          smallText(title: 'Qorem ipsum dolor sit amet, consectetur'),
          smallText(title: ' adipiscing elit. Nunc vulputate libero et velit'),
          smallText(title: ' interdum, ac aliquet odio mattis.'),
        ],
      ),
    );
  }
}

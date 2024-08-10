import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZegoCloudProvider extends ChangeNotifier {


  void startCall({required String userId ,required String userName,required BuildContext context}) async {
    var theme= Theme.of(context);
   await ZegoUIKitPrebuiltCallInvitationService().init(
      appID: 311118659, /*input your AppID*/
      appSign: 'ee39eec314b544e01f5e004a040a747e95f1e2a96288bd52fb1f622b5bb4205a' /*input your AppSign*/,
      userID:userId,
      userName:userName,
     uiConfig: ZegoCallInvitationUIConfig(
         invitee: ZegoCallInvitationInviteeUIConfig(
             backgroundBuilder: (context,size,calling){
               return Scaffold(
                 backgroundColor: theme.scaffoldBackgroundColor,
               );
             },
             spacingBetweenAvatarAndName: MediaQuery.sizeOf(context).height * 0.05,
             showCallingText: false,
             acceptButton: ZegoCallButtonUIConfig(
               textStyle: TextStyle(
                 fontSize: 0.02,
               ),
               icon: Container(
                 alignment: Alignment.center,
                 color: theme.colorScheme.secondaryFixed,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SvgPicture.asset(callIconSVG,color: theme.colorScheme.inversePrimary,),
                     CustomSized(width: 0.02,height: 0,),
                     Material(color:theme.colorScheme.secondaryFixed, child: largeText(title:'Accept',textSize: 15.0,color: theme.colorScheme.inversePrimary,)),
                   ],
                 ),
               ),
               iconSize: Size(MediaQuery.sizeOf(context).width * 0.4, MediaQuery.sizeOf(context).height * 0.06),
               size: Size(MediaQuery.sizeOf(context).width * 0.3, MediaQuery.sizeOf(context).height * 0.1),
             ),
             declineButton: ZegoCallButtonUIConfig(
               textStyle: TextStyle(
                 fontSize: 0.02,
               ),
               icon: Container(
                 alignment: Alignment.center,
                 color: theme.colorScheme.secondaryFixed,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SvgPicture.asset(callIconSVG,color: theme.colorScheme.inversePrimary,),
                     CustomSized(width: 0.02,height: 0,),
                     Material(
                         color:theme.colorScheme.secondaryFixed,
                         child: largeText(title:'Decline',textSize: 15.0,color: theme.colorScheme.inversePrimary,)),
                   ],
                 ),
               ),
               iconSize: Size(MediaQuery.sizeOf(context).width * 0.4, MediaQuery.sizeOf(context).height * 0.06),
               size: Size(MediaQuery.sizeOf(context).width * 0.3, MediaQuery.sizeOf(context).height * 0.1),
             ),
             popUp: ZegoCallInvitationNotifyPopUpUIConfig(
               builder: (data) {
                 return Material(
                   color: Colors.transparent,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       smallText(title: 'Incoming Call from',color: theme.primaryColor),
                       CustomSized(width: 0.2,height: 0,),
                       largeText(title: data.inviter!.name,color: theme.colorScheme.secondary),
                       // Custom UI elements can be added here
                     ],
                   ),
                 );
               },
               visible: true,
             )
         ),
         inviter: ZegoCallInvitationInviterUIConfig(
           backgroundBuilder: (context,size,calling){
             return Scaffold(
               backgroundColor: theme.scaffoldBackgroundColor,
             );
           },
           spacingBetweenAvatarAndName: MediaQuery.sizeOf(context).height * 0.05,
           cancelButton: ZegoCallButtonUIConfig(
             icon: Container(
               width: MediaQuery.sizeOf(context).width * 0.8,
               height: MediaQuery.sizeOf(context).height * 0.06,
               color: theme.colorScheme.secondaryFixed,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SvgPicture.asset(callIconSVG,color: theme.colorScheme.inversePrimary,),
                   CustomSized(width: 0.02,height: 0,),
                   Material(
                       color:theme.colorScheme.secondaryFixed,
                       child: largeText(title:'End call',textSize: 15.0,color: theme.colorScheme.inversePrimary,)),
                 ],
               ),
             ),
             iconSize: Size(MediaQuery.sizeOf(context).width * 0.8, MediaQuery.sizeOf(context).height * 0.05),
             size: Size(MediaQuery.sizeOf(context).width * 0.8, MediaQuery.sizeOf(context).height * 0.05),
           ),
           showCallingText: false,
         )
     ),
      plugins: [ZegoUIKitSignalingPlugin()],
      notificationConfig: ZegoCallInvitationNotificationConfig(
        androidNotificationConfig: ZegoCallAndroidNotificationConfig(
          showFullScreen: true,
          fullScreenBackground: 'assets/image/call.png',
          channelID: "ZegoUIKit",
          channelName: "Call Notifications",
          sound: "call",
          icon: "call",
        ),
        iOSNotificationConfig: ZegoCallIOSNotificationConfig(
          systemCallingIconName: 'CallKitIcon',
        ),
      ),
      requireConfig:(ZegoCallInvitationData data) {
        final config = ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
        /// support minimizing, show minimizing button
        config.topMenuBar.isVisible = true;
        config.topMenuBar.buttons.insert(0, ZegoCallMenuBarButtonName.minimizingButton);
        return config;
      },
    );
   print('---------------------------------------------init--------------------------------');
  }

  void onUserLogout() {
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }


}
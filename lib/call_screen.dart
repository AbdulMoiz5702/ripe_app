import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';


class CallScreen extends StatefulWidget {
  final String callerName ;
  final String userId;
  final String inviteId;
  const CallScreen({required this.callerName,required this.userId,required this.inviteId});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startCall();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // onUserLogout();
  }

  void onUserLogout() {
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }



  void startCall(){
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: 624395780, /*input your AppID*/
      appSign: 'e379e5684f0d1728dc11361d9df94810422e5e9b16cf5dce850ed2983f8ee5d8' /*input your AppSign*/,
      userID: widget.userId,
      userName: widget.callerName,
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
        final config = (data.invitees.length > 1)
            ? ZegoCallInvitationType.videoCall == data.type
            ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
            : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallInvitationType.videoCall == data.type
            ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
        /// support minimizing, show minimizing button
        config.topMenuBar.isVisible = true;
        config.topMenuBar.buttons.insert(0, ZegoCallMenuBarButtonName.minimizingButton);
        return config;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text('Your Name ${widget.callerName}',),
            SizedBox(height: 20,),
            Text('Your Id ${widget.userId}',),
            SizedBox(height: 20,),
            Text('Invite id ${widget.inviteId}',),
            SizedBox(height: 20,),
            ZegoSendCallInvitationButton(
              isVideoCall: true,
              //You need to use the resourceID that you created in the subsequent steps.
              //Please continue reading this document.
              resourceID: "ride_app",
              invitees: [
                ZegoUIKitUser(
                  id: widget.inviteId,
                  name: widget.callerName,
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}

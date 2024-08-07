import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/zego_cloud_provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';


class CallScreen extends StatefulWidget {
  final String callerName ;
  final String userId;
  final String inviteId;
  const CallScreen({super.key, required this.callerName,required this.userId,required this.inviteId});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ZegoCloudProvider>(context,listen:false).startCall(userId: widget.userId, userName: widget.callerName,context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Text('Your Name ${widget.callerName}',),
            const SizedBox(height: 20,),
            Text('Your Id ${widget.userId}',),
            const SizedBox(height: 20,),
            Text('Invite id ${widget.inviteId}',),
            const SizedBox(height: 20,),
            ZegoSendCallInvitationButton(
              isVideoCall: false,
              resourceID: "ride_app",
              invitees: [
                ZegoUIKitUser(
                  id: widget.inviteId,
                  name: widget.callerName,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

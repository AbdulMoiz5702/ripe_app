import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/controllers/zego_cloud_provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../consts/images_path.dart';

class CallButton extends StatefulWidget {
  const CallButton({
    required this.theme,
    required this.name,
    required this.id,
    this.color = primaryTextColor
  });

  final ThemeData theme;
  final String id ;
  final String name ;
  final Color color ;

  @override
  State<CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {

  @override

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<ZegoCloudProvider>(context, listen: false).startCall(userId: '1', userName: 'Moiz',context: context);
    print('=-----------------------------------------chatButton_init-----------------------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return ZegoSendCallInvitationButton(
      icon: ButtonIcon(
        icon: SvgPicture.asset(callIconSVG,color: widget.color,),
      ),
      iconSize: Size(23, 23),
      buttonSize: Size(25, 25),
      isVideoCall: false,
      resourceID: "rider_app",
      invitees: [
        ZegoUIKitUser(
          id: widget.id,
          name: widget.name,
        ),
      ],
    );
  }
}
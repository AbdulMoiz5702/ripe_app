import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/circle_avatar_widget.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/chatting_screens/calls/ongoing_call_again_screen.dart';

class ongoingCall extends StatelessWidget {
  const ongoingCall({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: CustomLeading(
          isHome: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSized(
              height: 0.26,
            ),
            Image.asset('assets/images/chatgirlimage.png'),
            CustomSized(
              height: 0.025,
            ),
            largeText(title: 'Samantha Gill', textSize: 14.0),
            CustomSized(
              height: 0.01,
            ),
            smallText(title: '00:34', textSize: 14.0),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/svg_pictures/mute.svg'),
                  CircleAvatar(
                    backgroundColor: backgroundpaperColor,
                      maxRadius: 22.0,
                      child: SvgPicture.asset('assets/svg_pictures/speakerhigh.svg')),
                  SecondaryAccessButton(
                    weight: FontWeight.w700,
                    widthbetweentextandicon: 0.02,
                    textsize: 15.0,
                    width: 0.6,
                    borderRadius: 26,
                    title: 'End call',
                    color: theme.colorScheme.secondaryFixed,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> OngoingCallAgainScreen()));
                    },
                    imagePath: 'assets/svg_pictures/endcallicon.svg',
                    isImagePath: true,
                  ),
                ],
              ),
            ),
            CustomSized(
              height: 0.03,
            )
          ],
        ),
      ),
    );
  }
}

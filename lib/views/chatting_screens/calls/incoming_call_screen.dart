import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/chatting_screens/calls/ongoing_call.dart';

class IncomingCallScreen extends StatelessWidget {
  const IncomingCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: CustomLeading(
          isHome: true,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSized(
              height: 0.02,
            ),
            Image.asset('assets/images/chatgirlimage.png'),
            CustomSized(
              height: 0.06,
            ),
            largeText(title: 'Samantha Gill', textSize: 14.0),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LocationAccessButton(
                    weight: FontWeight.w700,
                    widthbetweentextandicon: 0.02,
                    textsize: 15.0,
                    width: 0.4,
                    borderRadius: 26,
                    title: 'Decline',
                    color: redColor,
                    onTap: () {},
                    imagePath: 'assets/svg_pictures/declinecallicon.svg',

                    isImagePath: true,
                  ),
                  LocationAccessButton(
                    weight: FontWeight.w700,
                    widthbetweentextandicon: 0.02,
                    textsize: 15.0,
                    width: 0.4,
                    borderRadius: 26,
                    title: 'Accept',
                    color: alertDialogIconColor,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ongoingCall()));
                    },
                    imagePath: 'assets/svg_pictures/call.svg',
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

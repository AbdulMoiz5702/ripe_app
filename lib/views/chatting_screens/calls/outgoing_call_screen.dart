import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/chatting_screens/calls/incoming_call_screen.dart';

class UserCallScreen extends StatelessWidget {
  const UserCallScreen({super.key});

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
            LocationAccessButton(
              weight: FontWeight.w700,
              widthbetweentextandicon: 0.02,
              textsize: 15.0,
              width: 0.9,
              borderRadius: 26,
              title: 'End Call',
              color: redColor,
              onTap: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => IncomingCallScreen()));
              },
              imagePath: 'assets/svg_pictures/endcallicon.svg',
              isImagePath: true,

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

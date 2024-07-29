import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class OngoingCallAgainScreen extends StatelessWidget {
  const OngoingCallAgainScreen({super.key});

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
            smallText(title: 'Couldn\'t pick your call', textSize: 14.0),
            Spacer(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


              InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: backgroundpaperColor,
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.065,
                  // height: MediaQuery.sizeOf(context).height * height,
                  child: Center(
                    child: smallText(
                        title: 'Go back',
                        textSize: 15.0,
                        color: primaryTextColor,
                        weight: FontWeight.w700),
                  ),
                ),
              ),
                  SecondaryAccessButton(
                    weight: FontWeight.w700,
                    widthbetweentextandicon: 0.02,
                    textsize: 15.0,
                    width: 0.4,
                    borderRadius: 26,
                    title: 'Call again',
                    color: alertDialogIconColor,
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ongoingCall()));
                    },
                    imagePath: 'assets/svg_pictures/callagainicon.svg',
                    isImagePath: true,
                  ),
                ],
              ),
            ),
            CustomSized(
              height: 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

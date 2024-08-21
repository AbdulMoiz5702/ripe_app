import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../consts/images_path.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/allow_access_locaion_text.dart';
import '../../bottom_screen/Main_bottom_Screen.dart';

class Step7 extends StatelessWidget {
  const Step7({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            largeText(
              title: 'Allow Location access',
              textSize: 20.0,
              color: theme.primaryColor,
            ),
            Center(
              child: Image(
                alignment: Alignment.center,
                image: AssetImage(locationAccess),
                isAntiAlias: true,
                height: MediaQuery.sizeOf(context).height * 0.28,
                width: MediaQuery.sizeOf(context).width * 0.58,
                fit: BoxFit.cover,
              ),
            ),
            CustomSized(height: 0.015,),
            Align(
              alignment: Alignment.centerLeft,
              child: largeText(
                title: 'Why Location Access?',
                textSize: 18.0,
                color: theme.primaryColor
              ),
            ),
            CustomSized(height: 0.015,),
            Align(
                alignment: Alignment.centerLeft,
                child: smallText(title: 'Our app uses your location to:',color: theme.primaryColor)),

            CustomSized(
              height: 0.01,
            ),
            AllowAccessLocationText(
              pointOne: 'Match You with Nearby Drivers: ',
              pointTwo: 'Knowing your',
              pointThree:'location helps us connect you with the closest',
              pointFour: 'available driver.',
            ),
            AllowAccessLocationText(
              pointOne: 'Provide Accurate ETAs: ',
              pointTwo: 'We calculate ',
              pointThree:'estimated arrival times based on real-time',
              pointFour: 'traffic and your current position.',
            ),
            AllowAccessLocationText(
              pointOne: 'Ensure Safety: ',
              pointTwo: 'In case of emergencies, we can',
              pointThree:'quickly locate you and assist you. Your privacy',
              pointFour: 'matters to us, and we only use your location for',
              pointFive: 'ride-related purposes.',
            ),
            CustomSized(height: 0.03),
            LocationAccessButton(
              isImagePath: true,
              imagePath: mapPinSVG,
              title: 'Allow access',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainBottomScreen()));
              },
              borderRadius: 30,
              width: 1,
            ),
            CustomSized(height: 0.03),
            GestureDetector(
              onTap: (){},
              child: largeText(
                  title: 'Skip for now',
                  textSize: 15.0,
                  color: theme.primaryColor),
            ),
            CustomSized(height: 0.02),
          ],
        ),
      ),
    );
  }
}

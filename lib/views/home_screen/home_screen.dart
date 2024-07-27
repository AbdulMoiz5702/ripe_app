import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/home_screen_Text_Feild.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/Find_drivers/Find_drivers_Screen.dart';
import '../../resubale_widgets/invite_friend_container.dart';
import '../../resubale_widgets/outline_border_button.dart';
import '../become_driver/License_details.dart';
import '../tourist_ride_booking/explore_citry.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSized(
                height: 0.06,
              ),
              SvgPicture.asset(brandLogoSvg),
              CustomSized(
                height: 0.03,
              ),
              largeText(title: 'Welcome Peter 👋', textSize: 18.0,color: theme.primaryColor),
              CustomSized(
                height: 0.01,
              ),
              largeText(
                  title: 'Book a ride 👋',
                  textSize: 12.0,
                  color: theme.colorScheme.onSecondaryContainer),
              CustomSized(
                height: 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(inviteSmallOne.length, (index) {
                  return HomeScreenInviteButton(
                    imagePath: inviteImages[index],
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreCity()));
                          break;
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> FindDriversScreen()));
                          break;
                        default:
                          print('Unknown command');
                      }
                    },
                    text: inviteLargeOne[index],
                    smallOne: inviteSmallOne[index],
                    smallSecond: inviteSmallSecond[index],
                  );
                }),
              ),
              CustomSized(
                height: 0.01,
              ),
              Container(
                padding: EdgeInsets.all(14),
                height: MediaQuery.sizeOf(context).height * 0.2,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: theme.colorScheme.secondary,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            largeText(
                                title: 'Book a ride',
                                textSize: 18.0,
                                color: theme.colorScheme.secondaryContainer),
                            CustomSized(
                              height: 0.006,
                            ),
                            smallText(
                                title: "Enjoy your own personal ride",
                                color: theme.colorScheme.secondaryContainer),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: theme.colorScheme.surfaceContainer),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: theme.colorScheme.secondaryContainer,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    CustomSized(height: 0.03,),
                    HomeScreenTextField(
                        hintColor: theme.colorScheme.secondaryContainer,
                        color: theme.colorScheme.surfaceContainer,
                        enable:false,
                        controller: controller,
                        hint: 'Enter your destination',
                        onValidator: (value){},
                        onFieldSubmittedValue: (value){},
                        iconPath: search),
                  ],
                ),
              ),
              CustomSized(
                height: 0.02,
              ),
              largeText(
                  title: 'Become a driver',
                  textSize: 12.0,
                  color: theme.colorScheme.onSecondaryContainer),
              CustomSized(
                height: 0.01,
              ),
              OutlineBorderButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LicenseDetailsScreen()));
              },title: 'Become driver',),
              CustomSized(
                height: 0.02,
              ),
              largeText(title: 'Invite friends', textSize: 12.0, color: theme.colorScheme.onSecondaryContainer),
              CustomSized(
                height: 0.02,
              ),
              InviteFriendColorButton(title: 'Share', onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}

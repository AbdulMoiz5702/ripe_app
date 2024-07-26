import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/chatting_screens/user_rider_chat.dart';
import 'package:ride_app/views/scheduled_screen/components/location_tile.dart';

class RideHistoryScreen extends StatefulWidget {
  RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  final GlobalKey _toolTipKey1 = GlobalKey();
  final GlobalKey _toolTipKey2 = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Show the tooltip after a short delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        final dynamic tooltip1 = _toolTipKey1.currentState;
        tooltip1?.ensureTooltipVisible();

        final dynamic tooltip2 = _toolTipKey2.currentState;
        tooltip2?.ensureTooltipVisible();
      });
    });
  }
  List<Location> locations = [
    Location('The Centaurus Mall', 'F-8 - Islamabad, The Centaurus Mall', lightPrimaryTextColor, Icons.circle_outlined),
    Location('Safa Gold Mall', 'F-7 - Islamabad, Safa Gold Mall', orangeColor, Icons.circle_outlined),
    Location('Giga Mall', 'DHA Phase II - Islamabad, Giga Mall', orangeColor, Icons.circle),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomLeading(
        isHome: true,

      ),
        title: largeText(
          title: 'Ride Details',
          textSize: 20.0,
          weight: FontWeight.w700,
        ),
      ),
      body: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/basemap.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 135, top: 49),
                child: SvgPicture.asset('assets/svg_pictures/polyline.svg'),
              ),
              Positioned(
                left: 221,
                top: 45,
                child: SvgPicture.asset('assets/svg_pictures/dot.svg'),
              ),
              Positioned(
                left: 113,
                top: 80,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_pictures/starticon.svg',
                      fit: BoxFit.cover,
                      height: 48,
                      width: 45,
                    ),
                    const SizedBox(width: 10),
                    Tooltip(
                      decoration: BoxDecoration(
                        color: primaryTextColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      key: _toolTipKey1,
                      message: 'The Centaurus Mall',
                      height: MediaQuery.of(context).size.height * 0.04,
                      verticalOffset: -10.0,
                      preferBelow: false,
                      margin: EdgeInsets.only(left: 120),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                        fontFamily: 'Nunito Sans',
                      ),
                      child: const SizedBox(
                        width: 1,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 200,
                top: 11,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_pictures/destination_icon.svg',
                      fit: BoxFit.cover,
                      height: 48,
                      width: 45,
                    ),
                    const SizedBox(width: 5),
                    Tooltip(
                      decoration: BoxDecoration(
                        color: primaryTextColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      key: _toolTipKey2,
                      height: MediaQuery.of(context).size.height * 0.04,
                      message: 'Safa Gold Mall',
                      margin: EdgeInsets.only(left: 240),
                      verticalOffset: -15.0,
                      preferBelow: false,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                        fontFamily: 'Nunito Sans',
                      ),
                      child: const SizedBox(
                        width: 1,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    largeText(
                      title: '4 May, 2024',
                      weight: FontWeight.w700,
                      textSize: 17.0,
                      color: primaryTextColor,
                    ),
                    CustomSized(
                      height: 0.006,
                    ),
                    smallText(
                      title: 'Date',
                      weight: FontWeight.w400,
                      color: secondaryTextColor,
                      textSize: 14.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    largeText(
                      title: '5:20PM',
                      weight: FontWeight.w700,
                      textSize: 17.0,
                      color: primaryTextColor,
                    ),
                    CustomSized(
                      height: 0.006,
                    ),
                    smallText(
                      title: 'Time',
                      weight: FontWeight.w400,
                      color: secondaryTextColor,
                      textSize: 14.0,
                    ),
                  ],
                ),
                Column(
                  children: [
                    largeText(
                      title: '\$87',
                      weight: FontWeight.w700,
                      textSize: 17.0,
                      color: lightPrimaryTextColor,
                    ),
                    CustomSized(
                      height: 0.006,
                    ),
                    smallText(
                      title: 'Total Fare',
                      weight: FontWeight.w400,
                      color: secondaryTextColor,
                      textSize: 14.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                border: Border.all(
                  color: lightdarkColor,
                ),
                borderRadius: BorderRadius.circular(38.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg_pictures/edit_icon.svg',
                  ),
                  CustomSized(width: 0.02),
                  normalText(
                    title: 'Edit data & time',
                    textSize: 14.0,
                    color: primaryTextColor,
                  ),
                ],
              ),
            ),
          ),

          Divider(
            height: 0,
            thickness: MediaQuery.of(context).size.height * 0.0014,
            color: lightdarkColor,
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: backgroundpaperColor
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12.0, bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalText(title: 'Ride Distance', color: secondaryTextColor, textSize: 14.0, weight: FontWeight.w400 ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(


                              child: SvgPicture.asset('assets/svg_pictures/distance.svg'),

                              backgroundColor: whiteColor,
                            ),


                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: normalText(title: '14miles', color: primaryTextColor, textSize: 17.0, weight: FontWeight.w700 ),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 56.0, top: 12.0, bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalText(title: 'Ride Time', color: secondaryTextColor, textSize: 14.0, weight: FontWeight.w400 ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(


                              child: SvgPicture.asset('assets/svg_pictures/clock.svg'),

                              backgroundColor: whiteColor,
                            ),


                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: normalText(title: '28min 34sec', color: primaryTextColor, textSize: 17.0, weight: FontWeight.w700 ),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),

              ],
            ),


          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0, bottom: 6.0),
            child: normalText(title: 'Route Details', weight: FontWeight.w400, textSize: 14.0, color: secondaryTextColor),
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 6.0, bottom: 15.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return LocationTile(
                    location: locations[index],
                    isLast: index == locations.length - 1,
                  );
                },
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: MediaQuery.of(context).size.height * 0.0014,
            color: lightdarkColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0, bottom: 6.0),
            child: normalText(title: 'Driver Details', weight: FontWeight.w400, textSize: 14.0, color: secondaryTextColor),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/person.png')
                      )
                    ),
                  ),
                  maxRadius: 24.0,
                  backgroundColor: lightbackgroundpaperColor,
                ),



                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalText(title: 'Peter Dian', weight: FontWeight.w700, textSize: 14.0, color: primaryTextColor),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          children: [

                            SvgPicture.asset('assets/svg_pictures/Star.svg'),
                            normalText(title: ' 4.8', weight: FontWeight.w400, textSize: 11.0, color: primaryTextColor),
                            normalText(title: ' (23)', weight: FontWeight.w400, textSize: 11.0, color: secondaryTextColor),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Spacer(),
                CircleAvatar(
                  child: SvgPicture.asset('assets/svg_pictures/call_icon.svg'),

                  backgroundColor: primaryTextColor,
                  maxRadius: 24.0,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserRiderChatScreen()));
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                        child: CircleAvatar(
                          child: SvgPicture.asset('assets/svg_pictures/message icon.svg'),

                          backgroundColor: primaryTextColor,
                          maxRadius: 24.0,
                        ),
                      ),
                      Positioned(
                        right: 24.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: redColor,
                            border: Border.all(color: whiteColor),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          width: 11,
                          height: 11,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

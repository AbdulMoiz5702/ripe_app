import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/chat_rider_passenger_listTile.dart';
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


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Location> locations = [
      Location('The Centaurus Mall', 'F-8 - Islamabad, The Centaurus Mall', theme.colorScheme.secondary, Icons.circle_outlined),
      Location('Safa Gold Mall', 'F-7 - Islamabad, Safa Gold Mall', theme.colorScheme.secondaryFixed, Icons.circle_outlined),
      Location('Giga Mall', 'DHA Phase II - Islamabad, Giga Mall', theme.colorScheme.secondaryFixed, Icons.circle),
    ];
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomLeading(
        isHome: true,

      ),
        title: largeText(
          title: 'Ride Details',
          textSize: 20.0,
          weight: FontWeight.w700,
          color: theme.primaryColor,
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
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      key: _toolTipKey1,
                      message: 'The Centaurus Mall',
                      height: MediaQuery.of(context).size.height * 0.04,
                      verticalOffset: -10.0,
                      preferBelow: false,
                      margin: EdgeInsets.only(left: 120),
                      textStyle:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.inversePrimary,
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
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      key: _toolTipKey2,
                      height: MediaQuery.of(context).size.height * 0.04,
                      message: 'Safa Gold Mall',
                      margin: EdgeInsets.only(left: 240),
                      verticalOffset: -15.0,
                      preferBelow: false,
                      textStyle:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.inversePrimary,
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
                      color: theme.primaryColor,
                    ),
                    CustomSized(
                      height: 0.006,
                    ),
                    smallText(
                      title: 'Date',
                      weight: FontWeight.w400,
                      color: theme.colorScheme.onSecondaryContainer,
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
                      color: theme.primaryColor,
                    ),
                    CustomSized(
                      height: 0.006,
                    ),
                    smallText(
                      title: 'Time',
                      weight: FontWeight.w400,
                      color: theme.colorScheme.onSecondaryContainer,
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
                      color: theme.colorScheme.secondary,
                    ),
                    CustomSized(
                      height: 0.006,
                    ),
                    smallText(
                      title: 'Total Fare',
                      weight: FontWeight.w400,
                      color: theme.colorScheme.onSecondaryContainer,
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
                  color: theme.colorScheme.surface,
                ),
                borderRadius: BorderRadius.circular(38.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg_pictures/edit_icon.svg',
                    color:   theme.primaryColor,
                  ),
                  CustomSized(width: 0.02),
                  normalText(
                    title: 'Edit data & time',
                    textSize: 14.0,
                    color: theme.primaryColor,
                  ),
                ],
              ),
            ),
          ),

          Divider(
            height: 0,
            thickness: MediaQuery.of(context).size.height * 0.0014,
            color: theme.dividerColor,
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12.0, bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalText(title: 'Ride Distance', color: theme.colorScheme.onSecondaryContainer, textSize: 14.0, weight: FontWeight.w400 ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: SvgPicture.asset('assets/svg_pictures/distance.svg',color: theme.colorScheme.secondary,),
                             backgroundColor: theme.colorScheme.inversePrimary,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: normalText(title: '14miles', color: theme.primaryColor, textSize: 17.0, weight: FontWeight.w700 ),
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
                      normalText(title: 'Ride Time', color: theme.colorScheme.onSecondaryContainer, textSize: 14.0, weight: FontWeight.w400 ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: SvgPicture.asset('assets/svg_pictures/clock.svg',color: theme.colorScheme.secondary,),
                              backgroundColor: theme.colorScheme.inversePrimary,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: normalText(title: '28min 34sec', color: theme.primaryColor, textSize: 17.0, weight: FontWeight.w700 ),
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
            child: normalText(title: 'Route Details', weight: FontWeight.w400, textSize: 14.0, color: theme.colorScheme.onSecondaryContainer),
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
            color:  theme.dividerColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0, bottom: 6.0),
            child: normalText(title: 'Driver Details', weight: FontWeight.w400, textSize: 14.0, color: theme.colorScheme.onSecondaryContainer),
          ),
          ChatRiderListTIle(theme: theme),
        ],
      ),
    );
  }
}

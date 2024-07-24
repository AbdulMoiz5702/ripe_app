import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

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
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomLeading(),
        title: largeText(
          title: 'Ride Details',
          textSize: 20.0,
          weight: FontWeight.w700,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/basemap.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 175, top: 49),
                child: SvgPicture.asset('assets/svg_pictures/polyline.svg'),
              ),
              Positioned(
                left: 261,
                top: 45,
                child: SvgPicture.asset('assets/svg_pictures/dot.svg'),
              ),
              Positioned(
                left: 153, // Adjust this value for proper positioning
                top: 80,
                child: Tooltip(
                  decoration: BoxDecoration(
                    color: primaryTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  key: _toolTipKey1,
                  message: 'The Centaurus Mall',
                  height: MediaQuery.of(context).size.height * 0.05,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: whiteColor,
                    fontFamily: 'Nunito Sans',
                  ),
                  child: SvgPicture.asset(
                    'assets/svg_pictures/starticon.svg',
                    fit: BoxFit.cover,
                    height: 48,
                    width: 45,
                  ),
                ),
              ),
              Positioned(
                left: 240,
                top: 11,
                child: Tooltip(
                  preferBelow: false,
                  decoration: BoxDecoration(
                    color: primaryTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  key: _toolTipKey2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  message: 'Safa Gold Mall',
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: whiteColor,
                    fontFamily: 'Nunito Sans',
                  ),
                  child: SvgPicture.asset(
                      'assets/svg_pictures/destination_icon.svg',

                  height: 48,
                      width: 45,
                  ),
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
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                border: Border.all(
                  color: lightdarkColor,
                ),
                borderRadius: BorderRadius.circular(38.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg_pictures/edit_icon.svg',),
                  CustomSized(width: 0.02,),

                  normalText(
                    title: 'Edit data & time',
                    textSize: 14.0,
                    color: primaryTextColor
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

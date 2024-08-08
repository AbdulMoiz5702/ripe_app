import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/doted_divider.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/scheduled_screen/components/location_tile.dart';

import '../../../../resubale_widgets/CustomButton.dart';

class VeiwAndSendBidScreen extends StatefulWidget {
  VeiwAndSendBidScreen({super.key});

  @override
  State<VeiwAndSendBidScreen> createState() => _VeiwAndSendBidScreenState();
}

class _VeiwAndSendBidScreenState extends State<VeiwAndSendBidScreen> {
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
        leading: const CustomLeading(isHome: true,),
        title: largeText(
          title: 'Request details',
          textSize: 20.0,
          color: theme.primaryColor,
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.08,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(color: theme.colorScheme.onSecondaryContainer,spreadRadius: 0.0,blurRadius: 5),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SecondaryCustomButton(
              titleColor: theme.colorScheme.secondaryFixed,
              title: 'Decline',
              onTap: () {
              },
              onBoard: false,
              borderRadius: 30,
              width: 0.45,
              color: theme.colorScheme.secondaryFixedDim,
            ),
            CustomButton(title: 'Send bid', onTap: (){
            },borderRadius: 30,width: 0.45,onBoard: false,),
          ],
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
          CustomSized(height: 0.02,),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                largeText(title: 'Ride fair',textSize: 12.0,color: theme.colorScheme.onSecondaryContainer),
                CustomSized(height: 0.002,),
                largeText(title: '\$142',textSize: 40.0,color: theme.primaryColor),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(title: 'Est pick-up time',color: theme.colorScheme.onSecondaryContainer,),
                    CustomSized(height: 0.02,),
                    smallText(title: '12 min',color: theme.primaryColor,weight:FontWeight.w700 ),
                  ],
                ),
                CustomSized(height: 0.0,width: 0.2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(title: 'Est-pickup distance',color: theme.colorScheme.onSecondaryContainer,textSize: 11.0),
                    CustomSized(height: 0.02,),
                    smallText(title: '6miles',color: theme.primaryColor,weight:FontWeight.w700 ),
                  ],
                ),
              ],
            ),
          ),
          DottedDivider(),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    normalText(title: 'Est ride time', color: theme.colorScheme.onSecondaryContainer, textSize: 14.0, weight: FontWeight.w400 ),
                    normalText(title: '28min 34sec', color: theme.primaryColor, textSize: 17.0, weight: FontWeight.w700 ),
                  ],
                ),
                CustomSized(height: 0.0,width: 0.2,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    normalText(title: 'Ride distance', color: theme.colorScheme.onSecondaryContainer, textSize: 14.0, weight: FontWeight.w400 ),
                    normalText(title: '14miles', color: theme.primaryColor, textSize: 17.0, weight: FontWeight.w700 ),
                  ],
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
        ],
      ),
    );
  }
}


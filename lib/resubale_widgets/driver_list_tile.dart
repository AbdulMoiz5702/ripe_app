import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class DriverListItem extends StatelessWidget {
  final String name;
  final double rating;
  final int reviews;
  final String carDetails;
  final String avatarUrl;
  final String ? role;
  final String carType;
  final IconData ? iconData;
  final VoidCallback  onTap;

  const DriverListItem({
    Key? key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.carDetails,
    required this.avatarUrl,
    required this.role,
    required this.carType,
    this.iconData,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: containerBorderColor,
          radius: 30,
          backgroundImage: AssetImage(avatarUrl),
        ),
        title:Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             children: [
               largeText(title: name,textSize: 14.0),
               const CustomSized(width: 0.02,),
                role == null ?  Container(
                 alignment: Alignment.center,
                 height: MediaQuery.sizeOf(context).height * 0.04,
                 width: MediaQuery.sizeOf(context).width * 0.23,
                 decoration: BoxDecoration(
                   color: containerBorderColor,
                   borderRadius: BorderRadius.circular(30),
                 ),
                 child:largeText(title: 'Local Guide',textSize: 12.0,color: checkBoxColor),
               ): const SizedBox(height: 0,width: 0,),
             ],
           ),
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(carType)),
              ),
              child: iconData != null ?Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: checkBoxColor,
                ),
                child: Icon(iconData,color: whiteColor,size: 25,),
              ) : const SizedBox(width: 0,height: 0,),
            ),

          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const  Icon(Icons.star, color: Colors.amber, size: 18.0),
                smallText(textSize: 11.0,title:rating.toString(),color: primaryTextColor,),
                smallText(textSize: 11.0,title:' ( $reviews )',color: secondaryTextColor,),
              ],
            ),
            smallText(textSize: 11.0,title:carDetails,color: secondaryTextColor,),
          ],
        ),
      ),
    );
  }
}


class DriverDetailListItem extends StatelessWidget {
  final String name;
  final String rating;
  final String reviews;
  final String avatarUrl;
  final String ? role;
  final String totalRides;
  final String totalDrivingTime;


  const DriverDetailListItem({
    Key? key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.avatarUrl,
    required this.role,
    required this.totalRides,
    required this.totalDrivingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: containerBorderColor,
          radius: 30,
          backgroundImage: AssetImage(avatarUrl),
        ),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                largeText(title: '$name ',textSize: 14.0),
                const Icon(Icons.brightness_1,color: otpColor,size: 7,),
                const  Icon(Icons.star, color: Colors.amber, size: 18.0),
                smallText(textSize: 11.0,title:rating.toString(),color: primaryTextColor,),
                smallText(textSize: 11.0,title:'( $reviews)',color: secondaryTextColor,),
              ],
            ),
            role == null ?  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.04,
                    width: MediaQuery.sizeOf(context).width * 0.22,
                    decoration: BoxDecoration(
                      color: containerBorderColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:largeText(title: 'Local Guide',textSize: 12.0,color: checkBoxColor),
                  ): const SizedBox(height: 0,width: 0,),

          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              smallText(textSize: 11.0,title:'Total rides: $totalRides ',color: secondaryTextColor,),
              const Icon(Icons.brightness_1,color: otpColor,size: 7,),
              smallText(textSize: 11.0,title:' Driving time: $totalDrivingTime months',color: secondaryTextColor,),
            ],
          ),
        ),
      ),
    );
  }
}

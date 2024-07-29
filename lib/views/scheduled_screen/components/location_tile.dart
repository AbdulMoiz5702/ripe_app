import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class Location {
  final String name;
  final String address;
  final Color color;
  final IconData iconData;

  Location(this.name, this.address, this.color, this.iconData);
}

class LocationTile extends StatelessWidget {
  final Location location;
  final bool isLast;

  const LocationTile({Key? key, required this.location, this.isLast = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Icon(location.iconData, color: location.color, size: 20.0,),
            ),
            if (!isLast)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 0.0),
                child: Container(
                    width: 1.5,
                    height: 30,
                    color: lightdarkColor
                ),
              ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            normalText(
                title: location.name,
                weight: FontWeight.w700,
                textSize: 14.0,
                color: theme.primaryColor
            ),

            CustomSized(height: 0.005,),
            normalText(
                title: location.address,
                weight: FontWeight.w400,
                textSize: 11.0,
                color: theme.colorScheme.onSecondaryContainer
            ),
            CustomSized(height: 0.001,),
          ],
        ),
      ],
    );
  }
}
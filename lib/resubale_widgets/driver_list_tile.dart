import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class DriverListItem extends StatelessWidget {
  final String name;
  final double rating;
  final int reviews;
  final String carDetails;
  final String avatarUrl;
  final String? role;
  final String carType;
  final String? imagePath;
  final VoidCallback onTap;

  const DriverListItem(
      {Key? key,
      required this.name,
      required this.rating,
      required this.reviews,
      required this.carDetails,
      required this.avatarUrl,
      required this.role,
      required this.carType,
      this.imagePath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          radius: 30,
          backgroundImage: AssetImage(avatarUrl),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                largeText(
                    title: name, textSize: 14.0, color: theme.primaryColor),
                const CustomSized(
                  width: 0.02,
                ),
                role == null
                    ? Container(
                        alignment: Alignment.center,
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: largeText(
                            title: 'Local Guide',
                            textSize: 12.0,
                            color: theme.colorScheme.secondary),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(carType)),
              ),
              child: imagePath != null
                  ? Container(
                      height: 22,
                      width: 22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary,
                      ),
                      child: SvgPicture.asset(
                        imagePath.toString(),
                        color: theme.colorScheme.inversePrimary,
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18.0),
                smallText(
                  textSize: 11.0,
                  title: rating.toString(),
                  color: theme.primaryColor,
                ),
                smallText(
                  textSize: 11.0,
                  title: ' ( $reviews )',
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ],
            ),
            smallText(
              textSize: 11.0,
              title: carDetails,
              color: theme.colorScheme.onSecondaryContainer,
            ),
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
  final String? role;
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
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: containerBorderColor,
          radius: 30,
          backgroundImage: AssetImage(avatarUrl),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                largeText(
                    title: '$name ', textSize: 14.0, color: theme.primaryColor),
                Icon(
                  Icons.brightness_1,
                  color: theme.colorScheme.onTertiaryFixedVariant,
                  size: 7,
                ),
                const Icon(Icons.star, color: Colors.amber, size: 18.0),
                smallText(
                  textSize: 11.0,
                  title: rating.toString(),
                  color: theme.primaryColor,
                ),
                smallText(
                  textSize: 11.0,
                  title: ' ($reviews)',
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ],
            ),
            role == null
                ? Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.04,
                    width: MediaQuery.sizeOf(context).width * 0.22,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: largeText(
                        title: 'Local Guide',
                        textSize: 12.0,
                        color: theme.colorScheme.secondary),
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              smallText(
                textSize: 11.0,
                title: 'Total rides: $totalRides ',
                color: theme.colorScheme.onSecondaryContainer,
              ),
              Icon(
                Icons.brightness_1,
                color: theme.colorScheme.onTertiaryFixedVariant,
                size: 7,
              ),
              smallText(
                textSize: 11.0,
                title: ' Driving time: $totalDrivingTime months',
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

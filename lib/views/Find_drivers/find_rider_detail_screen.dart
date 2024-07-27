import 'package:flutter/material.dart';
import 'package:ride_app/alert_dialogs/selection_alert_dialg.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/rating_tile.dart';
import '../../consts/colors.dart';
import '../../resubale_widgets/FavoriteButton.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/driver_list_tile.dart';
import '../../resubale_widgets/ride_picture_list.dart';
import '../../resubale_widgets/text_widgets.dart';

class FindRiderDetailScreen extends StatelessWidget {
  final String riderName;
  final String rating;
  final String reviews;
  final String avatarUrl;
  final String? role;
  final String totalRides;
  final String totalDrivingTime;
  final String carAvatarUrl;
  final String carDetails;
  final String ? carIcon;

  const FindRiderDetailScreen(
      {super.key, required this.riderName,
      required this.rating,
      required this.totalRides,
      required this.totalDrivingTime,
      required this.role,
      required this.reviews,
      required this.carDetails,
      required this.avatarUrl,
      required this.carAvatarUrl,
      required this.carIcon});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: const CustomLeading(
          isHome: true,
        ),
        title: largeText(title: 'Find a driver', textSize: 20.0,color: theme.primaryColor),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                DriverDetailListItem(
                    name: riderName,
                    rating: rating,
                    reviews: rating,
                    avatarUrl: avatarUrl,
                    role: role,
                    totalRides: totalRides,
                    totalDrivingTime: totalDrivingTime),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FavoriteButton(
                        title: 'Add to favourite',
                        imagePath: favorite,
                        onTap: () {},
                      ),
                      FavoriteButton(
                        title: 'Message',
                        imagePath: messageIcon,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const CustomSized(
                  height: 0.01,
                ),
                CustomButton(
                  title: 'Book a ride',
                  onTap: () {
                    AlertDialogClass().showCustomDialog(context);
                  },
                  borderRadius: 30,
                  width: 0.9,
                  onBoard: false,
                )
              ],
            ),
          ),
          const RideDetailsScreen(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 8),
              child: smallText(
                title: 'Reviews',
                textSize: 14.0,
                color: theme.colorScheme.onSecondaryContainer
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  cacheExtent: 0,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return ReviewItem(
                        avatarUrl: avatarUrl,
                        name: riderName,
                        timestamp: 'Yesterday at 12:13PM',
                        rating: double.parse(rating),
                        reviewText: 'Rorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
                  })),
        ],
      ),
    );
  }
}

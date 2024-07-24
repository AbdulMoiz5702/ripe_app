import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

class ReviewItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String timestamp;
  final double rating;
  final String reviewText;

  const ReviewItem({super.key, 
    required this.avatarUrl,
    required this.name,
    required this.timestamp,
    required this.rating,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarUrl),
                      radius: 25,
                    ),
                    const CustomSized(width: 0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        largeText(
                          title: name,
                          textSize: 14.0,
                        ),
                        const CustomSized(height: 0.01,),
                        smallText(
                          title: timestamp,
                          textSize: 11.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.0,
                        itemBuilder: (context, _) => const  Icon(
                          Icons.star_rounded,
                          color: ratingColor,
                        ),
                        onRatingUpdate: (rating) {
                          // Do nothing, read-only
                        },
                      ),
                      const CustomSized(width: 0.02,),
                      smallText(
                        title : rating.toString(),
                        color: primaryTextColor
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text( reviewText,style: TextStyles.bulletPoint,),
          ],
        ),
      ),
    );
  }
}
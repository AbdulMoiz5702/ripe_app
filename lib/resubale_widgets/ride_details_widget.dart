import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/scheduled_screen/ride_history_screen.dart';

class RideDetailsWidget extends StatelessWidget {
  final String name;
  final String price;
  final Color color;
  final String month;
  final bool showInProgress;
  final bool showContainerColor;
  final bool showborderLine;

  const RideDetailsWidget({
    super.key,
    required this.name,
    required this.price,
    required this.color,
    required this.month,
    this.showInProgress = false,
    this.showContainerColor = false,
    this.showborderLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RideHistoryScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: showContainerColor ? color : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (month.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 20),
                child: largeText(
                  title: month.toUpperCase(),
                  textSize: 12.0,
                  weight: FontWeight.w500,
                  color: secondaryTextColor,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        largeText(
                            title: name,
                            color: primaryTextColor,
                            textSize: 17.0
                        ),
                        if (showInProgress)
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: lightGreenColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: normalText(
                                  title: 'In Progress',
                                  textSize: 12.0,
                                  weight: FontWeight.w700,
                                  color: darkgreenColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  largeText(
                    title: '\$${price}',
                    color: checkBoxColor,
                    textSize: 17.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 12.0, left: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.polyline_sharp,
                      color: checkBoxColor,
                      size: 11.5,
                    ),
                  ),
                  normalText(
                      title: '$price miles',
                      color: secondaryTextColor,
                    textSize: 11.0,
                    weight: FontWeight.w400,

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.circle_outlined,
                    color: checkBoxColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: normalText(
                        title: 'Askari 11, Rawalpindi, Punjab 46000, Pakistan',
                        color: secondaryTextColor,
                        textSize: 11.0,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 4.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.01,
                width: MediaQuery.of(context).size.width * 0.003,
                decoration: BoxDecoration(
                  color: lightgreyColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.circle_outlined,
                    color: orangeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: normalText(
                        title: 'Liaquat Bagh, Rawalpindi, Punjab 46000, Pakistan',
                        color: secondaryTextColor,
                        textSize: 11.0,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 4.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.01,
                width: MediaQuery.of(context).size.width * 0.003,
                decoration: BoxDecoration(
                  color: lightgreyColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: orangeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: normalText(
                        title: 'H2VV+96R, 7 Main Peshawar Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan',
                        color: secondaryTextColor,
                        textSize: 11.0,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            showborderLine ?
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                children: List.generate(70, (index) {
                  return const Text(
                    '_',
                    style: TextStyle(color: dividerColor),
                  );
                }),
              ),
            ) :
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                children: List.generate(40, (index) {
                  return const Text(
                    '_ ',
                    style: TextStyle(color: dividerColor),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

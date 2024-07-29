import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
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
    var theme = Theme.of(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RideHistoryScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: showContainerColor == true ? color : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (month.isNotEmpty)
              Padding(
                padding:  EdgeInsets.only(top: 12.0, left: 20),
                child: largeText(
                  title: month.toUpperCase(),
                  textSize: 12.0,
                  weight: FontWeight.w500,
                  color: theme.colorScheme.onSecondaryContainer,
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
                            color: theme.primaryColor,
                            textSize: 17.0
                        ),
                        if (showInProgress)
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.outline,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: smallText(
                                  title: 'In Progress',
                                  textSize: 12.0,
                                  weight: FontWeight.w700,
                                  color: theme.colorScheme.outlineVariant,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  largeText(
                    title: '\$${price}',
                    color: theme.colorScheme.secondary,
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
                    child:SvgPicture.asset(
                      normalRoute,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  smallText(
                      title: '$price miles',
                      color: theme.colorScheme.onSecondaryContainer,
                    textSize: 11.0,
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
                    color: theme.colorScheme.secondary,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: smallText(
                        title: 'Askari 11, Rawalpindi, Punjab 46000, Pakistan',
                        color: theme.colorScheme.onSecondaryContainer,
                        textSize: 11.0,
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
                  color: theme.dividerColor,
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
                    color: theme.colorScheme.secondaryFixed,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: smallText(
                        title: 'Liaquat Bagh, Rawalpindi, Punjab 46000, Pakistan',
                        color: theme.colorScheme.onSecondaryContainer,
                        textSize: 11.0,
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
                  color: theme.dividerColor,
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
                    color: theme.colorScheme.secondaryFixed,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: smallText(
                        title: 'H2VV+96R, 7 Main Peshawar Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan',
                        color: theme.colorScheme.onSecondaryContainer,
                        textSize: 11.0,
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
                  return  Text(
                    '_',
                    style: TextStyle(color: theme.dividerColor),
                  );
                }),
              ),
            ) :
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                children: List.generate(40, (index) {
                  return  Text(
                    '_ ',
                    style: TextStyle(color: theme.dividerColor),
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

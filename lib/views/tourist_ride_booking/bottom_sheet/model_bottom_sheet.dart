import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/consts/strings.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import '../../../resubale_widgets/bottom_sheets_leading.dart';
import '../../../resubale_widgets/home_screen_Text_Feild.dart';
import '../../custom_rote_navigation/custom_route_navigation.dart';
import '../shedule_your_ride.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetsLeadings(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSized(
                  height: 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    largeText(
                        title: 'Where to?',
                        textSize: 20.0,
                        color: theme.primaryColor),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(createRoute(screen: SheduleYourRideScreen()));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              advanceCalender,
                              color: theme.colorScheme.secondary,
                            ),
                            smallText(
                                title: ' Now ', color: theme.primaryColor),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomSized(
                  height: 0.02,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(exploreScreen.length, (index) {
                      return Consumer<ScheduleRideProvider>(
                          builder: (context, provider, _) {
                        return GestureDetector(
                          onTap: () {
                            provider.selectedIndex(index);
                          },
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      exploreScreenIcons[index],
                                      color: provider.index == index
                                          ? theme.primaryColor
                                          : theme
                                              .colorScheme.onSecondaryContainer,
                                    ),
                                    CustomSized(
                                      width: 0.02,
                                    ),
                                    smallText(
                                      title: exploreScreen[index],
                                      color: provider.index == index
                                          ? theme.primaryColor
                                          : theme
                                              .colorScheme.onSecondaryContainer,
                                    ),
                                    CustomSized(
                                      width: 0.04,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height: 2,
                                  color: provider.index == index
                                      ? theme.colorScheme.tertiaryContainer
                                      : theme.scaffoldBackgroundColor,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    }),
                  ),
                ),
                CustomSized(
                  height: 0.02,
                ),
                HomeScreenTextField(
                  controller: controller,
                  hint: 'search',
                  onValidator: (value) {},
                  onFieldSubmittedValue: (newValue) {},
                  iconPath: searchBlack,
                  color: theme.colorScheme.surfaceContainerHighest,
                  hintColor: theme.primaryColor,
                ),
                Column(
                  children: List.generate(6, (index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(8),
                      dense: true,
                      leading: SvgPicture.asset(
                        currentLocationSVG,
                        color: theme.colorScheme.secondary,
                        alignment: Alignment.bottomCenter,
                        height: 25,
                      ),
                      title: smallText(
                          title: 'Giga Mall', color: theme.primaryColor),
                      subtitle: smallText(
                          title: 'DHA Phase II, Islamabad',
                          textSize: 11.0,
                          color: theme.colorScheme.onSecondaryContainer),
                      trailing: Icon(
                        Icons.favorite_border_rounded,
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

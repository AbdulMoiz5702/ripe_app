import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/shedule_ride_provider.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../resubale_widgets/bottom_sheets_leading.dart';
import '../../../resubale_widgets/notification_list_tile.dart';
import '../../../resubale_widgets/text_widgets.dart';

class SearchForRiderBottom extends StatefulWidget {
  const SearchForRiderBottom({super.key});
  @override
  _SearchForRiderBottomState createState() => _SearchForRiderBottomState();
}

class _SearchForRiderBottomState extends State<SearchForRiderBottom> {
  ValueNotifier<double> _currentHeight = ValueNotifier(0.12);

  @override
  void dispose() {
    _currentHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DraggableScrollableSheet(
      maxChildSize: 0.5,
      initialChildSize: 0.5,
      minChildSize: 0.11,
      expand: false,
      snap: true,
      builder: (context, scrollController) {
        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            _currentHeight.value = notification.extent;
            return true;
          },
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.5,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ValueListenableBuilder<double>(
              valueListenable: _currentHeight,
              builder: (context, height, child) {
                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: BottomSheetsLeadings(),
                    ),
                    SliverToBoxAdapter(
                      child: height < 0.12
                          ? Container(height: 0, width: 0)
                          : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomSized(height: 0.02),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: largeText(
                                title: 'Searching for riders',
                                textSize: 20.0,
                                color: theme.primaryColor,
                              ),
                            ),
                            CustomSized(height: 0.02),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                largeText(
                                  textSize: 12.0,
                                  title: 'Ride fare',
                                  color: theme.colorScheme.onSecondaryContainer,
                                ),
                                CustomSized(height: 0.002),
                                largeText(
                                  textSize: 50.0,
                                  title: '\$142',
                                  color: theme.primaryColor,
                                  weight: FontWeight.w800,
                                ),
                              ],
                            ),
                            CustomSized(height: 0.02),
                            GestureDetector(
                              onTap: () {
                                // Show fare comparison dialog
                              },
                              child: largeText(
                                title: 'Compare fare with our competitors',
                                textSize: 13.0,
                                weight: FontWeight.w700,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            CustomSized(height: 0.02),
                            Consumer<ScheduleRideProvider>(
                              builder: (context, provider, _) {
                                return NotificationListTile(
                                  title: 'Pre-approved ride request',
                                  value: provider.preRide,
                                  onChanged: (value) {
                                    provider.changePreRide(value);
                                  },
                                );
                              },
                            ),
                            Divider(
                              thickness: 2,
                              color: theme.dividerColor,
                            ),
                            CustomSized(height: 0.02),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SecondaryCustomButton(
                          titleColor: theme.colorScheme.secondaryFixed,
                          title: 'Cancel search for ride',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          onBoard: false,
                          borderRadius: 30,
                          width: 1,
                          color: theme.colorScheme.secondaryFixedDim,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/bottom_nav_button.dart';
import 'package:ride_app/views/scheduled_screen/scheduled_screen.dart';
import 'package:ride_app/views/user_profile/user_profile_screen.dart';
import '../../controllers/bottom_screen_provider.dart';
import '../../resubale_widgets/custom_floating_button.dart';
import '../home_screen/home_screen.dart';
import '../notification/notification_screen.dart';
import 'package:provider/provider.dart';

class MainBottomScreen extends StatelessWidget {
  const MainBottomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Consumer<BottomScreenProvider>(
        builder: (context, provider, child) {
          return PageStorage(bucket: bucket, child: provider.currentScreen);
        },
      ),
      floatingActionButton:  CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        shadowColor: theme.colorScheme.secondaryContainer,
        color: theme.colorScheme.secondaryContainer,
        height: 75,
        shape:  CircularNotchedRectangle(),

        notchMargin: 12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<BottomScreenProvider>(builder: (context,provider,_){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonNav(
                  index: 0,
                  imagePath: houseSvg,
                  title: 'Home',
                  currentTab: provider.currentTab,
                  onPressed: () {
                        provider.updateScreen(0, const HomeScreen());
                  },
                ),
                CustomButtonNav(
                  index: 1,
                  imagePath: calenderSvg,
                  title: 'Schedule',
                  currentTab: provider.currentTab,
                  onPressed: () {
                    provider.updateScreen(1, const ScheduledScreen());
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 8, right: 8),
                  child: CustomButtonNav(
                    index: 2,
                    imagePath: null,
                    title: 'Book Ride',
                    currentTab: provider.currentTab,
                    onPressed: () {
                      provider.updateScreen(2, const HomeScreen());
                    },
                  ),
                ),
                CustomButtonNav(
                  index: 3,
                  imagePath: bellSimpleSvg,
                  title: 'Notifications',
                  currentTab: provider.currentTab,
                  onPressed: () {
                    provider.updateScreen(3, const NotificationScreen());
                  },
                ),
                CustomButtonNav(
                  index: 4,
                  imagePath: userSvg,
                  title: 'Profile',
                  currentTab: provider.currentTab,
                  onPressed: () {
                    provider.updateScreen(4, const UserProfileScreen());
                  },
                ),
              ],
            );
          })
        ),
      ),
    );
  }
}


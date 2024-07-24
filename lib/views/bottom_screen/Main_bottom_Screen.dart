import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/main.dart';
import 'package:ride_app/resubale_widgets/bottom_nav_button.dart';
import 'package:ride_app/views/scheduled_screen/scheduled_screen.dart';
import 'package:ride_app/views/user_profile/user_profile_screen.dart';
import '../../resubale_widgets/custom_floating_button.dart';
import '../home_screen/home_screen.dart';
import '../notification/notification_screen.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  _MainBottomScreenState createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 75,
        shape: const CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonNav(
                  index: 0,
                  imagePath: houseSvg,
                  title: 'Home',
                  currentTab: currentTab,
                  onPressed: () {
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 0;
                    });
                  },
                ),
                CustomButtonNav(
                  index: 1,
                  imagePath: calenderSvg,
                  title: 'Schedule',
                  currentTab: currentTab,
                  onPressed: () {
                    setState(() {
                      currentScreen = const ScheduledScreen(title: 'hio');
                      currentTab = 1;
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30,left: 8,right: 8),
                  child: CustomButtonNav(
                    index: 2,
                    imagePath: null, // No icon for Book Ride
                    title: 'Book Ride',
                    currentTab: currentTab,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomeScreen();
                        currentTab = 2;
                      });
                    },
                  ),
                ),
                CustomButtonNav(
                  index: 3,
                  imagePath: bellSimpleSvg,
                  title: 'Notifications',
                  currentTab: currentTab,
                  onPressed: () {
                    setState(() {
                      currentScreen = const NotificationScreen();
                      currentTab = 3;
                    });
                  },
                ),
                CustomButtonNav(
                  index: 4,
                  imagePath: userSvg,
                  title: 'Profile',
                  currentTab: currentTab,
                  onPressed: () {
                    setState(() {
                      currentScreen = const UserProfileScreen();
                      currentTab = 4;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

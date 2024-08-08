import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/consts/images_path.dart';

import '../../../controllers/bottom_screen_provider.dart';


class RiderBottomScreen extends StatelessWidget {
  const RiderBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body:Consumer<BottomScreenProvider>(builder: (context,provider,_){
        return provider.screen[provider.riderCurrentIndex];
    }),
      bottomNavigationBar: Consumer<BottomScreenProvider>(builder: (context,provider,_){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          color: theme.colorScheme.secondaryContainer,
          height: MediaQuery.sizeOf(context).height * 0.09,
          child: BottomNavigationBar(
            backgroundColor: theme.colorScheme.secondaryContainer,
            selectedIconTheme: IconThemeData(color: theme.colorScheme.secondary),
            unselectedIconTheme:IconThemeData(color: theme.colorScheme.onSecondaryContainer),
            unselectedFontSize: 10,
            selectedFontSize: 12,
            selectedItemColor: theme.colorScheme.secondary,
            unselectedItemColor: theme.colorScheme.onSecondaryContainer ,
            type: BottomNavigationBarType.fixed,
            currentIndex: provider.riderCurrentIndex,
            onTap: (index) {
              provider.changeRiderScreen(index);
            },
            items:  [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(dashBoardSVG,color: provider.riderCurrentIndex == 0 ? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(messageSVG,color: provider.riderCurrentIndex == 1 ? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(requestSVG,color: provider.riderCurrentIndex == 2 ? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,),
                label: 'Requests',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(bellSimpleSvg,color: provider.riderCurrentIndex == 3? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(userSvg,color: provider.riderCurrentIndex == 4 ? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,),
                label: 'Profile',
              ),
            ],
          ),
        );
      })
    );
  }
}

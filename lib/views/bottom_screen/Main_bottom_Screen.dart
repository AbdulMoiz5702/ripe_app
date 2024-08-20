import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import '../../consts/strings.dart';
import '../../controllers/bottom_screen_provider.dart';
import '../../resubale_widgets/custom_floating_button.dart';
import 'package:provider/provider.dart';

class MainBottomScreen extends StatelessWidget {
  const MainBottomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Consumer<BottomScreenProvider>(
        builder: (context, provider, child) {
          return provider.allScreen[provider.mainScreenIndex];
        },
      ),
      floatingActionButton:  CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Consumer<BottomScreenProvider>(builder: (context,provider,_){
        return AnimatedBottomNavigationBar.builder(
          splashRadius: 0.0,
            backgroundColor: theme.colorScheme.secondaryContainer,
            height: 65,
            itemCount: bottomTextList.length,
            tabBuilder: (index, isActive) {
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    index == 2
                        ? Container(
                      height: 0,
                      width: 0,
                    )
                        : SvgPicture.asset(
                      allowDrawingOutsideViewBox:true,
                      bottomIconList[index],
                      height: 20,
                      width: 20,
                      color:  provider.mainScreenIndex == index ? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,
                    ),
                    CustomSized(height: 0.005,width: 0,),
                    Text(
                      bottomTextList[index],
                      style: TextStyle(
                        color: provider.mainScreenIndex == index ? theme.colorScheme.secondary : theme.colorScheme.onSecondaryContainer,
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              );
            },
            activeIndex: provider.mainScreenIndex,
            shadow: Shadow(color: theme.colorScheme.secondaryContainer,),
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              provider.changeMainScreen(index);
            });
      })
      
    );
  }
}

